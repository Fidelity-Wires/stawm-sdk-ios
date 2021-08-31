//
//  ViewController.swift
//  Example
//
//  Created by Saika Natsui on 2020/06/22.
//  Copyright © 2020 FidelityWires. All rights reserved.
//

import UIKit
import StawmServiceStatus
import GoogleMaps
import MapKit

final class ViewController: UIViewController {

    // MARK: - StawmServiceStatus
    /// Initialize `ServiceStatusInspector`
    private let serviceStatusInspector = ServiceStatusInspector()

    @IBOutlet private weak var availableView: UIStackView!
    @IBOutlet private weak var notAvailableView: UIStackView!
    @IBOutlet private weak var label: UILabel!

    private var defaultMapView: GMSMapView?
    private var alternativeMapView: MKMapView?

    private var currentSettings: [ServiceStatusInspector.DebugSetting] = [
        .init(service: .googleMaps, status: .red),
    ]

    private var services: [Service] {
        currentSettings.map({ $0.service })
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set API Key.
        ServiceStatusInspector.setApiKey("xxxxx")

        let _ = serviceStatusInspector

            // If you would like to use Debug Mode.
            // Please go　Product -> Scheme -> Edit Scheme
            // Set `-STAWNDebugEnabled` as `Aguments Passed On Launch`
            .setDebug(settings: currentSettings)

        // Start inspection.
        inspect()
    }

    private func inspect() {

        serviceStatusInspector.inspect(
            services: services,
            completion: { (result) in
                DispatchQueue.main.async { // Because needs to update UI.
                    switch result {
                    case .success(let status) where status.isAllAvailable():
                        // All serivces are available.
                        self.showDefaultMap()
                        self.alternativeMapView = nil
                    case .success:
                        // Some services are not available.
                        self.defaultMapView = nil
                        self.showAlternativeMap()
                    case .failure(let error):
                        // Handle inspection error.
                        print(error.localizedDescription)
                    }
                }

        })
    }

    private let center = (35.66549514200059, 139.71212428459896)

    private func showDefaultMap() {
        GMSServices.provideAPIKey("SET_API_KEY") // https://developers.google.com/maps/documentation/ios-sdk/get-api-key

        let camera = GMSCameraPosition.camera(
            withLatitude: center.0,
            longitude: center.1,
            zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        view.addSubview(mapView)
        defaultMapView = mapView

        markers.forEach { m in
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(
                latitude: m.latidude,
                longitude:  m.longitude)
            marker.title = m.title
            marker.snippet = m.snippet
            marker.map = mapView
        }
    }

    private func showAlternativeMap() {
        let mapView = MKMapView(frame: view.frame)
        let region = MKCoordinateRegion(
            center: .init(latitude: center.0, longitude: center.1),
            span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(region, animated: false)
        view.addSubview(mapView)
        alternativeMapView = mapView

        markers.forEach { m in
            let marker = MKPointAnnotation()
            marker.coordinate = CLLocationCoordinate2D(
                latitude: m.latidude,
                longitude:  m.longitude)
            marker.title = m.title
            marker.subtitle = m.snippet
            mapView.addAnnotation(marker)
        }
    }

    /// Go to Debug Setting
    @IBAction private func buttonDidTap() {
        let viewController = DebugSettingViewController.instantiate()
        viewController.delegate = self
        viewController.settings = currentSettings
        present(viewController, animated: true)
    }

}

extension ViewController: DebugSettingViewControllerDelegate {

    func settingDidUpdate(settings: [ServiceStatusInspector.DebugSetting]) {
        currentSettings = settings
        let _ = serviceStatusInspector.setDebug(settings: currentSettings)
        inspect()
    }
}

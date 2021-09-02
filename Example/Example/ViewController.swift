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
import Mapbox

final class ViewController: UIViewController {

    // MARK: - StawmServiceStatus
    /// Initialize `ServiceStatusInspector`
    private let serviceStatusInspector = ServiceStatusInspector(remoteConfig: ServiceStatusRemoteConfig())

    private var defaultMapView: GMSMapView?
    private var alternativeMapView: UIView?

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
            // Set `-STAWNDebugEnabled` ON as `Aguments Passed On Launch`
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
                        self.showAlternativeMap(type: .mapbox)
                    case .failure(let error):
                        // Handle inspection error.
                        print(error.localizedDescription)
                    }
                }

        })
    }

    private let center = (35.66549514200059, 139.71212428459896)

    private func showDefaultMap() {
        // FIXME: Please set your API key if you would like to use Google Maps.
        // https://developers.google.com/maps/documentation/ios-sdk/get-api-key
        GMSServices.provideAPIKey("SET_API_KEY")

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

    enum MapType {
        case apple
        case mapbox
    }

    private func showAlternativeMap(type: MapType) {
        switch type {
        case .apple: showAppleMap()
        case .mapbox: showMapbox()
        }
    }

    private func showAppleMap() {
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

    private func showMapbox() {
        // FIXME: Please set your API key in `Info.plist` before using Mapbox Maps.
        // https://docs.mapbox.com/ios/maps/guides/
        let url = URL(string: "mapbox://styles/mapbox/streets-v11")
        let mapView = MGLMapView(frame: view.bounds, styleURL: url)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(
            CLLocationCoordinate2D(latitude: center.0, longitude: center.1),
            zoomLevel: 15,
            animated: false)
        view.addSubview(mapView)
        alternativeMapView = mapView

        markers.forEach { m in
            let marker = MGLPointAnnotation()
            marker.coordinate = CLLocationCoordinate2D(
                latitude: m.latidude,
                longitude:  m.longitude)
            marker.title = m.title
            marker.subtitle = m.snippet
            mapView.addAnnotation(marker)
        }
    }

    // FIXME: `Debug Setting` button is hidden.
    // If you would like to use Debug Mode locally,
    // Please go　Product -> Scheme -> Edit Scheme
    // Set `-STAWNDebugEnabled` ON as `Aguments Passed On Launch`
    // And set `hidden = false` for the button on storyboard.
    /// Go to Debug Setting
    @IBAction private func buttonDidTap() {
        let viewController = DebugSettingViewController.instantiate()
        viewController.delegate = self
        viewController.settings = currentSettings
        present(viewController, animated: true)
    }

    /// Go to Remote Setting
    @IBAction private func remoteButtonDidTap() {
        let viewController = RemoteSettingViewController.instantiate()
        viewController.delegate = self
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

extension ViewController: RemoteSettingViewControllerDelegate {
    func settingDidUpdate() {
        inspect()
    }
}

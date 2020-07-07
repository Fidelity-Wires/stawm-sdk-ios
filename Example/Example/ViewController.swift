//
//  ViewController.swift
//  Example
//
//  Created by Saika Natsui on 2020/06/22.
//  Copyright © 2020 FidelityWires. All rights reserved.
//

import UIKit
import Taqion
import TaqionCore

final class ViewController: UIViewController {

    /// Initialize `ServiceStatusInspector`
    private let serviceStatusInspector = ServiceStatusInspector()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set API Key.
        Taqion.sharedInstance().setApiKey("xxxxx")

        // Start inspection.
        let _ = serviceStatusInspector

            // If you would like to use Debug Mode.
            // Please go　Product -> Scheme -> Edit Scheme
            // Set `-STAWNDebugEnabled` as `Aguments Passed On Launch`
            .setDebug(settings: [
                .init(service: .googlePlus, isAvailable: false),
                .init(service: .googleCalendar, isAvailable: false),
                .init(service: .googleMaps, isAvailable: false),
            ])


        serviceStatusInspector.inspect(
            services: [.googlePlus, .googleCalendar, .googleMaps],
            completion: { (result) in
                switch result {
                case .success(let status):
                    if status.isAllAvailable() {
                        // All serivces are available.
                        print("All available.")
                    } else {
                        // Some services are not available.
                        let googleMapsStatus = status.status(for: .googleMaps)
                        print(googleMapsStatus?.isAvailable)
                    }
                case .failure(let error):
                    // Handle inspection error.
                    print(error.localizedDescription)
                }
        })
    }


}


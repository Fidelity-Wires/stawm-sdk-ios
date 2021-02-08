//
//  NetstatusViewController.swift
//  Example
//
//  Created by Saika Natsui on 2021/01/20.
//  Copyright © 2021 FidelityWires. All rights reserved.
//

import UIKit
import StawmSpeedTest
import StawmNetstatus

final class NetstatusViewController: UIViewController {

    @IBOutlet private weak var speedTestButton: UIButton!
    @IBOutlet private weak var netstatusButton: UIButton!

    private var isMeasuring: Bool = false {
        didSet {
            DispatchQueue.main.async {
                let title = self.isMeasuring ? "Cancel Speed Test" : "Start Speed Test"
                self.speedTestButton.setTitle(title, for: .normal)
            }
        }
    }

    private var isMonitoring: Bool = false {
        didSet {
            DispatchQueue.main.async {
                let title = self.isMonitoring ? "Cancel Monitor Net Status" : "Start Monitor Net Status"
                self.netstatusButton.setTitle(title, for: .normal)
            }
        }
    }

    private let dataUploader = SampleUploader()

    // MARK: - StawmSpeedTest
    private let speedTestConfig: SpeedTest.Config = .init(
        host: "",
        port: 50001,
        size: 278000)

    /// Initialize `SpeedDataCollector`
    private lazy var speedDataCollector = SpeedDataCollector(
        config: speedTestConfig,
        uploder: dataUploader,
        userId: "xxxxx")

    // MARK: - StawmNetstatus
    private let netstatusConfig: Measure.Config = .init(
        pingHost: "",
        tracerouteHost: "")

    private lazy var netstatusDataCollector = NetstatusDataCollector(
        config: netstatusConfig,
        uploder: dataUploader,
        userId: "xxxxx")

    override func viewDidLoad() {
        super.viewDidLoad()

        NetstatusDataCollector.shouldMeasureOnlyNetworkChanged = false
        speedDataCollector.delegate = self
    }

    @IBAction private func speedTestButtonDidTap(_ sender: Any) {

        if isMeasuring {
            speedDataCollector.cancel()
        } else {
            speedDataCollector.start()
        }
        isMeasuring = !isMeasuring
    }

    @IBAction private func netstatusButtonDidTap(_ sender: Any) {

        if isMonitoring {
            netstatusDataCollector.stopMonitoring()
        } else {
            netstatusDataCollector.startMonitoring()
        }
        isMonitoring = !isMonitoring
    }
}

extension NetstatusViewController: SpeedDataCollectorDelegate {

    func didFinishUploadSpeedTest(mbps: Double) {
        print("didFinishUploadSpeedTest: \(mbps)")
    }

    func didFinishDownloadSpeedTest(mbps: Double) {
        print("didFinishDownloadSpeedTest: \(mbps)")
    }

    func didFinishPingSpeedTest(ms: Double) {
        print("didFinishPingSpeedTest: \(ms)")
        isMeasuring = false
    }

    func didFinishDataCollecting() {
        print(didFinishDataCollecting)
    }

    func didFailToCompleteSpeedTest(error: Error) {
        print("didFailToCompleteSpeedTest: \(error.localizedDescription)")
    }

    func didFailToCollectData(error: Error) {
        print("didFailToCollectData: \(error.localizedDescription)")
    }

    func didFailToCollectLocation(error: Error) {
        print("didFailToCollectLocation: \(error.localizedDescription)")
    }

}

final class SampleUploader: StawmSpeedTest.UploaderProtocol, StawmNetstatus.UploaderProtocol {

    func upload(data: [StawmNetstatus.UploadData], completion: @escaping (Error?) -> Void) {
        print("StawmNetstatus Result: \(data)")
        completion(nil)
    }


    func upload(data: [StawmSpeedTest.UploadData], completion: @escaping (Error?) -> Void) {
        print("StawmSpeedTest Result: \(data)")
        completion(nil)
    }
}

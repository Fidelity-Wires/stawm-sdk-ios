import XCTest
import StawmSpeedTest
import StawmNetstatus
import StawmTraceroute
import StawmServiceStatus

final class PackageTests: XCTestCase {

    private lazy var speedDataCollector = SpeedDataCollector(
        config: .init(host: "", port: 50001, size: 278000),
        uploder: SpeedDataUploader(),
        userId: "xxxxx")

    private lazy var netstatusDataCollector = NetstatusDataCollector(
        config: .init(pingHost: "", tracerouteHost: ""),
        uploder: NetstatusUploader(),
        userId: "xxxxx")

    func testSpeedTest() {
        speedDataCollector.start()
        XCTAssertTrue(speedDataCollector.isMeasuring)
    }

    func testNetstatus() {
        netstatusDataCollector.startMonitoring()
        XCTAssertTrue(netstatusDataCollector.isMonitoring)
    }

    func testServiceStatus() {
        ServiceStatusInspector.setApiKey("xxxxx")
        XCTAssertEqual(ServiceStatusInspector.apiKey, "xxxxx")
    }

    func testTraceroute() {
        let ping = StawmTracerouteUtils.ping(target: "")
        XCTAssertEqual(ping.status, "fail")
    }

    static var allTests = [
        ("testSpeedTest", testSpeedTest),
        ("testNetstatus", testNetstatus),
        ("testServiceStatus", testServiceStatus),
        ("testTraceroute", testTraceroute),
    ]
}

final class SpeedDataUploader: StawmSpeedTest.UploaderProtocol {

    func upload(data: [StawmSpeedTest.UploadData], completion: @escaping (Error?) -> Void) {
        completion(nil)
    }
}

final class NetstatusUploader: StawmNetstatus.UploaderProtocol {

    func upload(data: [StawmNetstatus.UploadData], completion: @escaping (Error?) -> Void) {
        completion(nil)
    }
}

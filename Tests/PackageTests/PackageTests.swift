import XCTest
import StawmServiceStatus

final class PackageTests: XCTestCase {

    func testServiceStatus() {
        ServiceStatusInspector.setApiKey("xxxxx")
        XCTAssertEqual(ServiceStatusInspector.apiKey, "xxxxx")
    }

    static var allTests = [
        ("testServiceStatus", testServiceStatus),
    ]
}

import XCTest

import packageTests

var tests = [XCTestCaseEntry]()
tests += packageTests.allTests()
XCTMain(tests)

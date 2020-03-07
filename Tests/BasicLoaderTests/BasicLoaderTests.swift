import XCTest
@testable import BasicLoader

final class BasicLoaderTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(BasicLoader().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

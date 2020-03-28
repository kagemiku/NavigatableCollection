import XCTest
@testable import NavigatableCollection

final class NavigatableCollectionTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(NavigatableCollection().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

import XCTest
@testable import CommonAlgorithms

final class BisectTests: XCTestCase {
    func testAscendingSeq() {
        let a = [1, 2, 3, 4, 5, 6, 7, 8]
        XCTAssertEqual(a.bisect(0), 0)
        XCTAssertEqual(a.bisect(8), 7)
        XCTAssertEqual(a.bisect(5), 4)
        XCTAssertEqual(a.bisect(0, onLeft: false), 0)
        XCTAssertEqual(a.bisect(8, onLeft: false), 8)
        XCTAssertEqual(a.bisect(5, onLeft: false), 5)
    }

    func testDescendingSeq() {
        let a = [8, 7, 6, 5, 4, 3, 2, 1]
        XCTAssertEqual(a.bisect(0, ascending: false), 8)
        XCTAssertEqual(a.bisect(8, ascending: false), 0)
        XCTAssertEqual(a.bisect(5, ascending: false), 3)
        XCTAssertEqual(a.bisect(0, onLeft: false, ascending: false), 8)
        XCTAssertEqual(a.bisect(8, onLeft: false, ascending: false), 1)
        XCTAssertEqual(a.bisect(5, onLeft: false, ascending: false), 4)
    }
}

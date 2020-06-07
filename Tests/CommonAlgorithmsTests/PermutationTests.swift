import XCTest
@testable import CommonAlgorithms

final class PermutationTests: XCTestCase {
    func testCountValue() {
        let a = [1, 2, 3, 1, 2, 3, 4, 6, 7]
        XCTAssertEqual(a.countValue(of: 1), 2)
        XCTAssertEqual(a.countValue(of: 3), 2)
        XCTAssertEqual(a.countValue(of: 5), 0)
        XCTAssertEqual(a.countValue(of: 6), 1)
        XCTAssertEqual(a.countValue(of: 3, from: 3), 1)
        XCTAssertEqual(a.countValue(of: 7, from: 0, to: 6), 0)
    }

    func testIsPermutation() {
        let a = [1, 2, 3, 4, 5]
        XCTAssertTrue(a.isPermutation(of: [5, 2, 3, 4, 1]))
        XCTAssertTrue(a.isPermutation(of: [1, 2, 4, 3, 5]))
        XCTAssertFalse(a.isPermutation(of: [1, 2, 4, 3, 4]))
        XCTAssertFalse(a.isPermutation(of: [1, 2, 4, 3, 5, 6]))
    }
}

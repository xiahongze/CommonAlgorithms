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

    func testReverse() {
        var a = [1, 2, 3, 4, 5]
        a.reverseInplace()
        XCTAssertEqual(a, [5, 4, 3, 2, 1])
        a.reverseInplace(from: 0, to: 3)
        XCTAssertEqual(a, [3, 4, 5, 2, 1])
        a.reverseInplace(from: 2, to: 5)
        XCTAssertEqual(a, [3, 4, 1, 2, 5])
    }

    func testNextPermutation() {
        var s = ["a", "a", "b"]
        XCTAssertTrue(s.nextPermutation())
        XCTAssertEqual(s, ["a", "b", "a"])
        XCTAssertTrue(s.nextPermutation())
        XCTAssertEqual(s, ["b", "a", "a"])
        XCTAssertFalse(s.nextPermutation())
        XCTAssertEqual(s, ["a", "a", "b"])

        var a = [3, 2, 1]
        var b = [[Int]]()
        repeat {
            b.append(a)
        } while (a.previousPermutation())
        XCTAssertEqual(b,
                       [[3, 2, 1],
                        [3, 1, 2],
                        [2, 3, 1],
                        [2, 1, 3],
                        [1, 3, 2],
                        [1, 2, 3]])
    }
}

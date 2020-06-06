import XCTest
@testable import CommonAlgorithms

final class HeapTests: XCTestCase {
    func testBuildHeaps() {
        var heap = [35, 33, 42, 10, 14, 19, 27, 44, 26, 31]
        Heap.buildMinHeap(with: &heap)
        XCTAssertEqual(heap, [10, 14, 19, 26, 31, 42, 27, 44, 33, 35])
        Heap.buildMaxHeap(with: &heap)
        XCTAssertEqual(heap, [44, 35, 42, 33, 31, 19, 27, 26, 14, 10])
        var empty = [Int]()
        Heap.buildMinHeap(with: &empty)
        XCTAssertEqual(empty, [])
    }

    func testHeapSort() {
        var seq = [12, 11, 13, 5, 6, 7]
        Heap.sort(&seq)
        XCTAssertEqual(seq, [5, 6, 7, 11, 12, 13])
        Heap.sort(&seq, ascending: false)
        XCTAssertEqual(seq, [13, 12, 11, 7, 6, 5])
    }

    static var allTests = [
        ("testBuildHeaps", testBuildHeaps),
        ("testHeapSort", testHeapSort)
    ]
}

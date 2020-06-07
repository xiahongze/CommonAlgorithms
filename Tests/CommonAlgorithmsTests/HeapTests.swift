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
    
    func testPush() {
        var heap = [10, 14, 19, 26, 31, 42, 27, 44, 33, 35]
        Heap.push(5, into: &heap, maxHeap: false)
        XCTAssertEqual(heap, [5, 10, 19, 26, 14, 42, 27, 44, 33, 35, 31])
        Heap.push(18, into: &heap, maxHeap: false)
        XCTAssertEqual(heap, [5, 10, 18, 26, 14, 19, 27, 44, 33, 35, 31, 42])
        
        heap = [44, 35, 42, 33, 31, 19, 27, 26, 14, 10]
        Heap.push(18, into: &heap)
        XCTAssertEqual(heap, [44, 35, 42, 33, 31, 19, 27, 26, 14, 10, 18])
    }
    
    func testPop() {
        var heap = [10, 14, 19, 26, 31, 42, 27, 44, 33, 35]
        var head = Heap.pop(from: &heap, maxHeap: false)
        XCTAssertEqual(head, 10)
        XCTAssertEqual(heap, [14, 26, 19, 33, 31, 42, 27, 44, 35])
        
        heap = [44, 35, 42, 33, 31, 19, 27, 26, 14, 10]
        head = Heap.pop(from: &heap)
        XCTAssertEqual(head, 44)
        XCTAssertEqual(heap, [42, 35, 27, 33, 31, 19, 10, 26, 14])
    }
    
    func testPushPop() {
        var heap = [10, 14, 19, 26, 31, 42, 27, 44, 33, 35]
        var head = Heap.pushPop(27, from: &heap, maxHeap: false)
        XCTAssertEqual(head, 10)
        XCTAssertEqual(heap, [14, 26, 19, 27, 31, 42, 27, 44, 33, 35])
        head = Heap.pushPop(37, from: &heap, maxHeap: false)
        XCTAssertEqual(head, 14)
        XCTAssertEqual(heap, [19, 26, 27, 27, 31, 42, 37, 44, 33, 35])
        head = Heap.pushPop(18, from: &heap, maxHeap: false)
        XCTAssertEqual(head, 18)
        XCTAssertEqual(heap, [19, 26, 27, 27, 31, 42, 37, 44, 33, 35])
        
        heap = [44, 35, 42, 33, 31, 19, 27, 26, 14, 10]
        head = Heap.pushPop(27, from: &heap)
        XCTAssertEqual(head, 44)
        XCTAssertEqual(heap, [42, 35, 27, 33, 31, 19, 27, 26, 14, 10])
        head = Heap.pushPop(43, from: &heap)
        XCTAssertEqual(head, 43)
        XCTAssertEqual(heap, [42, 35, 27, 33, 31, 19, 27, 26, 14, 10])
    }

//    static var allTests = [
//        ("testBuildHeaps", testBuildHeaps),
//        ("testHeapSort", testHeapSort)
//    ]
}

/**
 * Heap.swift follows Python's heapq package
 * https://docs.python.org/3/library/heapq.html
 * Refs:
 * https://www.geeksforgeeks.org/heap-sort/
 * https://www.geeksforgeeks.org/binary-heap/
 * https://www.geeksforgeeks.org/min-heap-in-java/
 * Created by Hongze Xia on 6/6/20.
 */

enum Heap {

    static public func getLeftChild(_ i: Int) -> Int {
        return 2 * i + 1
    }

    static public func getRightChild(_ i: Int) -> Int {
        return 2 * i + 2
    }

    static public func getLParent(_ i: Int) -> Int {
        return (i - 1) / 2
    }

    // default to a max-heap
    // according to `intro to algo` p155-156
    // O(logN) time complexity or O(h) where h is the height of the heap
    static public func heapify<T:Comparable>(_ seq: inout Array<T>, at i: Int = 0, maxHeap: Bool = true, maxPos: Int? = nil) {
        var rootIdx = i
        let (left, right) = (2 * i + 1, 2 * i + 2)
        var comparator: (T, T) -> Bool = (<)
        if !maxHeap {
            comparator = (>)
        }
        let n = maxPos ?? seq.count

        // compare the current root with left
        if left < n && comparator(seq[rootIdx], seq[left]) {
            rootIdx = left
        }

        // compare the current root with right
        if right < n && comparator(seq[rootIdx], seq[right]) {
            rootIdx = right
        }

        // swap if needed and heapify
        if rootIdx != i {
            (seq[i], seq[rootIdx]) = (seq[rootIdx], seq[i])
            // all parameters need to be updated and passed to the recursive call
            heapify(&seq, at: rootIdx, maxHeap: maxHeap, maxPos: n)
        }
    }

    // linear time
    static public func buildMaxHeap<T: Comparable>(with seq: inout Array<T>) {
        for i in (0..<seq.count / 2).reversed() {
            Heap.heapify(&seq, at: i, maxHeap: true)
        }
    }

    // linear time
    static public func buildMinHeap<T: Comparable>(with seq: inout Array<T>) {
        for i in (0..<seq.count / 2).reversed() {
            Heap.heapify(&seq, at: i, maxHeap: false)
        }
    }

    // nlogn time
    static public func sort<T:Comparable>(_ seq: inout Array<T>, ascending: Bool = true) {
        if ascending {
            buildMaxHeap(with: &seq)
        } else {
            buildMinHeap(with: &seq)
        }
        for i in (0..<seq.count).reversed() {
            (seq[i], seq[0]) = (seq[0], seq[i])
            Heap.heapify(&seq, at: 0, maxHeap: ascending, maxPos: i)
        }
    }
}

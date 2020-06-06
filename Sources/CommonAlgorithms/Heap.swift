/**
 * Heap.swift follows Python's heapq package
 * https://docs.python.org/3/library/heapq.html
 * Refs:
 * Introduction to Algorithms, p151, heapsort
 * https://www.geeksforgeeks.org/heap-sort/
 * https://www.geeksforgeeks.org/binary-heap/
 * https://www.geeksforgeeks.org/min-heap-in-java/
 * Created by Hongze Xia on 6/6/20.
 */

enum Heap {

    @inlinable static public func getLeftChild(_ i: Int) -> Int {
        return 2 * i + 1
    }

    @inlinable static public func getRightChild(_ i: Int) -> Int {
        return 2 * i + 2
    }

    @inlinable static public func getParent(_ i: Int) -> Int {
        return (i - 1) / 2
    }

    // default to a max-heap
    // according to `intro to algo` p155-156
    // O(logN) time complexity or O(h) where h is the height of the heap
    static public func heapify<T:Comparable>(_ seq: inout Array<T>, at i: Int = 0, maxHeap: Bool = true, maxPos: Int? = nil) {
        var rootIdx = i
        let (left, right) = (getLeftChild(i), getRightChild(i))
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
        // linear time
        if ascending {
            buildMaxHeap(with: &seq)
        } else {
            buildMinHeap(with: &seq)
        }
        // n * log n
        for i in (0..<seq.count).reversed() {
            (seq[i], seq[0]) = (seq[0], seq[i])
            Heap.heapify(&seq, at: 0, maxHeap: ascending, maxPos: i)
        }
    }

    // O(h) time, bottom up swapping
    static public func push<T:Comparable>(_ item: T, into seq: inout Array<T>, maxHeap: Bool = true) {
        seq.append(item)
        var currentIdx = seq.count - 1
        var parentIdx = getParent(currentIdx)
        var comparator: (T, T) -> Bool = (<)
        if !maxHeap {
            comparator = (>)
        }
        while comparator(seq[parentIdx], seq[currentIdx]) {
            (seq[parentIdx], seq[currentIdx]) = (seq[currentIdx], seq[parentIdx])
            (currentIdx, parentIdx) = (parentIdx, getParent(parentIdx))
        }
    }

    // O(h) time, top down heapify
    static public func pop<T:Comparable>(from seq: inout Array<T>, maxHeap: Bool = true) -> T {
        let item = seq[0] // save the head
        seq[0] = seq[seq.count - 1] // move the tail to the head
        _ = seq.popLast() // abandoned
        heapify(&seq, at: 0, maxHeap: maxHeap)
        return item
    }
}

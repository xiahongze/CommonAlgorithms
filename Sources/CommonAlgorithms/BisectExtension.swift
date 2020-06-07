/**
 * Ref:
 * https://github.com/python/cpython/blob/master/Lib/bisect.py
 * https://stackoverflow.com/questions/31904396/swift-binary-search-for-standard-array
 *
 * Created by Hongze Xia on 7/6/20.
 */

extension RandomAccessCollection where Element: Comparable {

    // bisect assumes the array/collection is already sorted in ascending order
    // user need to make sure that lo and hi is within valid range
    // onLeft returns the insert position on the left. Vice versa.
    func bisect(_ el: Element, lo: Int = 0, hi: Int? = nil, onLeft: Bool = true, ascending: Bool = true) -> Index {
        var low = index(startIndex, offsetBy: lo)
        var high = endIndex
        if let h = hi {
            high = index(startIndex, offsetBy: h)
        }
        var comparator: (Element, Element) -> Bool = ascending ? (<) : (>)
        if !onLeft {
            comparator = ascending ? (<=) : (>=)
        }

        while low != high {
            let mid = index(low, offsetBy: distance(from: low, to: high) / 2)
            if comparator(self[mid], el) {
                low = index(after: mid)
            } else {
                high = mid
            }
        }
        return low
    }
}

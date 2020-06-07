/**
 * Ref:
 * https://en.cppreference.com/w/cpp/algorithm/is_permutation
 *
 * Created by Hongze Xia on 8/6/20.
 */

extension RandomAccessCollection where Element: Equatable {
    // O(n)
    func countValue(of value: Element, from start: Index? = nil, to end: Index? = nil) -> Int {
        var s = start ?? startIndex
        let e = end ?? endIndex
        var c = 0
        while s != e {
            if self[s] == value {
                c += 1
            }
            s = index(after: s)
        }
        return c
    }
    
    // O(n^2)
    func isPermutation(of another: Self) -> Bool {
        if another.count != self.count {
            return false
        }
        // skip common prefix
        var startThis = startIndex
        var startOther = another.startIndex
        while self[startThis] == another[startOther] {
            startThis = index(after: startThis)
            startOther = index(after: startOther)
        }
        // count the rest
        while startThis != endIndex {
            if startThis != self.firstIndex(of: self[startThis]) {
                startThis = index(after: startThis)
                continue // skip if we have already counted this value
            }
            let appears = another.countValue(of: self[startThis], from: startOther)
            if appears == 0 || countValue(of: self[startThis], from: startThis) != appears {
                return false
            }
            startThis = index(after: startThis)
        }
        return true
    }
}

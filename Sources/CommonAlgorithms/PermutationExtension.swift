/**
 * Ref:
 * https://en.cppreference.com/w/cpp/algorithm/is_permutation
 * https://en.cppreference.com/w/cpp/algorithm/next_permutation
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

extension RandomAccessCollection where Element: Comparable, Self: MutableCollection {
    mutating func reverseInplace(from start: Index? = nil, to end: Index? = nil) {
        var s = start ?? startIndex
        var e = end ?? endIndex
        while s != e {
            e = index(before: e)
            if s != e {
                self.swapAt(s, e)
                s = index(after: s)
            }
        }
    }

    // Transforms into the next permutation from the set of all permutations
    // that are lexicographically ordered with respect to operator<.
    // Returns true if such permutation exists, otherwise transforms the first permutation
    // as if it is sorted and returns false.
    // if ascending==false, return the previous permutation
    mutating func nextPermutation(ascending: Bool = true) -> Bool {
        if self.count < 2 {
            return false
        }
        var i = index(before: endIndex)
        let comparator: (Element, Element) -> Bool = ascending ? (<) : (>)

        while true {
            let i1 = i
            i = index(before: i)
            if comparator(self[i], self[i1]) {
                var i2 = index(before: endIndex)
                while !comparator(self[i], self[i2]) {
                    i2 = index(before: i2)
                }
                self.swapAt(i, i2)
                self.reverseInplace(from: i1, to: endIndex)
                return true
            }
            if i == startIndex {
                self.reverseInplace()
                return false
            }
        }
    }

    mutating func previousPermutation() -> Bool {
        return nextPermutation(ascending: false)
    }
}

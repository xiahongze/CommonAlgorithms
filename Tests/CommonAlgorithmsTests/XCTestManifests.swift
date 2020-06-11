import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(BisectTests.allTests),
        testCase(HeapTests.allTests),
        testCase(PermutationTests.allTests),
    ]
}
#endif

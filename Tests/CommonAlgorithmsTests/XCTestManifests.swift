import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CommonAlgorithmsTests.allTests),
        testCase(HeapTests.allTests),
    ]
}
#endif

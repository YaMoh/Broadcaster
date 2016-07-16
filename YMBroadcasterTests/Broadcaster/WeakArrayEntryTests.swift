//
//  WeakArrayEntryTests.swift
//  YMBroadcaster
//
//  Created by Yaser on 16/07/16.
//  Copyright © 2016 Bespoke Code AB. All rights reserved.
//

import XCTest
@testable import YMBroadcaster

class WeakArrayEntryTests: XCTestCase {

    func testReferenceAssignment() {

        let testObject = TestObject()
        let weakReferenceWrapper = WeakArrayEntry<TestObject>(testObject)
        let storedReference = weakReferenceWrapper.getReference()

        XCTAssertTrue(storedReference === testObject)
    }

    func testReferenceDeallocated() {

        var testObject: TestObject? = TestObject()
        let weakReferenceWrapper = WeakArrayEntry<TestObject>(testObject!)
        testObject = nil

        XCTAssertNotNil(weakReferenceWrapper)
        let storedReference = weakReferenceWrapper.getReference()
        XCTAssertNil(storedReference)
    }
}


class TestObject {

    deinit {
        NSLog("Testobject released!")
    }
}

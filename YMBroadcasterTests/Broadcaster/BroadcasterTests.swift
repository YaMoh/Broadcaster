//
//  BroadcasterTests.swift
//  YMBroadcaster
//
//  Created by Yaser on 16/07/16.
//  Copyright © 2016 Bespoke Code AB. All rights reserved.
//

import XCTest
@testable import YMBroadcaster

class BroadcasterTests: XCTestCase {

    func testAddListener() {
        let broadcaster = Broadcaster<Listener>()
        let listener = Listener()
        broadcaster.add(listener: listener)

        broadcaster.broadcast { (listenerToInvoke) in
            XCTAssert(listener === listenerToInvoke)
        }
    }

    func testRemoveListener() {
        let broadcaster = Broadcaster<Listener>()
        let listener = Listener()
        broadcaster.add(listener: listener)
        broadcaster.remove(listener: listener)

        broadcaster.broadcast { (listenerToInvoke) in
            XCTAssert(false)
        }
    }

    func testRemoveNonExistantListener() {
        let broadcaster = Broadcaster<Listener>()
        let listener = Listener()
        broadcaster.remove(listener: listener)
    }

    func testBroadcast() {
        let broadcaster = Broadcaster<Listener>()
        let listener1 = Listener()
        let listener2 = Listener()
        let listener3 = Listener()
        let listeners = [listener1, listener2, listener3]

        broadcaster.add(listener: listener1)
        broadcaster.add(listener: listener2)
        broadcaster.add(listener: listener3)

        broadcaster.broadcast { (listenerToInvoke) in
            XCTAssert(listeners.contains({ (listener: Listener) -> Bool in
                return listener === listenerToInvoke
            }))
        }
    }

    func testBroadcastWhileRemovingListener() {
        let broadcaster = Broadcaster<Listener>()
        let listener1 = Listener()
        let listener2 = Listener()
        let listener3 = Listener()

        broadcaster.add(listener: listener1)
        broadcaster.add(listener: listener2)
        broadcaster.add(listener: listener3)

        broadcaster.broadcast { (listenerToInvoke) in
            if listenerToInvoke === listener2 {
                broadcaster.remove(listener: listener2)
            }
        }
    }
}

class Listener {
}

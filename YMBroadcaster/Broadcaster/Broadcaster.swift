//
//  Broadcaster.swift
//  YMBroadcaster
//
//  Created by Yaser on 16/07/16.
//  Copyright © 2016 Bespoke Code AB. All rights reserved.
//

import Foundation

/**
 * @brief "Broadcasts" method invocations to it's added listeners. Does not
 * retain the listeners. Meant to be an easier-to-follow and less crash-prone
 * replacement for NSNotifications
 */
class Broadcaster<T :AnyObject> {

    private var listeners = [WeakArrayEntry<T>]()

    //MARK: - Public functions

    /**
     * @breif Adds a listener to the broadcaster
     * @param listener The listener to add. Will not be retained.
     */
    func add(listener listener: T) {
        let entry = WeakArrayEntry(listener)
        self.listeners.append(entry)
        self.compact()
    }

    /**
     * @breif Removes a listener from the broadcaster
     * @param listener The listener to remove.
     */
    func remove(listener listener: T) {
        for (index, element) in self.listeners.enumerate() {
            if element.getReference() === listener {
                self.listeners.removeAtIndex(index)
            }
        }
        self.compact()
    }

    func broadcast(closure: (listener: T)->()) {
        self.listeners.forEach { (entry: WeakArrayEntry<T>) in
            if let reference = entry.getReference() {
                closure(listener: reference)
            }
        }
    }

    //MARK: - Private functions

    private func compact() {
        for (index, element) in self.listeners.enumerate() {
            if element.getReference() == nil {
                self.listeners.removeAtIndex(index)
            }
        }
    }
}
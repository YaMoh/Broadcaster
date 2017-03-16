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

    fileprivate var listeners = [WeakArrayEntry<T>]()

    //MARK: - Public functions

    /**
     * @breif Adds a listener to the broadcaster
     * @param listener The listener to add. Will not be retained.
     */
    func add(listener: T) {
        let entry = WeakArrayEntry(listener)
        self.listeners.append(entry)
        self.compact()
    }

    /**
     * @breif Removes a listener from the broadcaster
     * @param listener The listener to remove.
     */
    func remove(listener: T) {
        for (index, element) in self.listeners.enumerated() {
            if element.getReference() === listener {
                self.listeners.remove(at: index)
            }
        }
        self.compact()
    }

    func broadcast(_ closure: (_ listener: T)->()) {
        self.listeners.forEach { (entry: WeakArrayEntry<T>) in
            if let reference = entry.getReference() {
                closure(reference)
            }
        }
    }

    //MARK: - Private functions

    fileprivate func compact() {
        for (index, element) in self.listeners.enumerated() {
            if element.getReference() == nil {
                self.listeners.remove(at: index)
            }
        }
    }
}

//
//  WeakArrayEntry.swift
//  YMBroadcaster
//
//  Created by Yaser on 16/07/16.
//  Copyright © 2016 Bespoke Code AB. All rights reserved.
//

import Foundation

/**
 * @brief Class which wraps a pointer weakly to prevent retention
 */
class WeakArrayEntry<T: AnyObject> {

    private weak var weakReference: T?

    //MARK: - Init functions

    required init(_ reference: T) {
        self.weakReference = reference
    }

    //MARK: - Public functions

    func getReference() -> T? {
        return self.weakReference
    }

}
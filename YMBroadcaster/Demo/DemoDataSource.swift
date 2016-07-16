//
//  DemoDataSource.swift
//  YMBroadcaster
//
//  Created by Yaser on 16/07/16.
//  Copyright © 2016 Bespoke Code AB. All rights reserved.
//

import Foundation

protocol DemoDataSourceListener: AnyObject {
    func newDataReceived(data: String)
}

// NSObject inheritence needed for IBOutlets
class DemoDataSource: NSObject {

    private let broadcaster = Broadcaster<AnyObject>()

    //MARK: - Public functions 

    func addListener(listener: DemoDataSourceListener) {
        self.broadcaster.addListener(listener)
    }

    func removeListener(listener: DemoDataSourceListener) {
        self.broadcaster.removeListener(listener)
    }

    @IBAction func generateData() {
        let dataWhichCouldBeGenerated = ["Ape", "Banana", "Citrus", "Donkey"]
        let index = random()%4
        let data = dataWhichCouldBeGenerated[index]
        self.broadcaster.broadcast { (listener) in
            guard let listener = listener as? DemoDataSourceListener else {
                return
            }
            listener.newDataReceived(data)
        }
    }
}
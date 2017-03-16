//
//  DemoSubscriberView.swift
//  YMBroadcaster
//
//  Created by Yaser on 16/07/16.
//  Copyright © 2016 Bespoke Code AB. All rights reserved.
//

import UIKit

class DemoSubscriberView: UIView, DemoDataSourceListener {

    @IBOutlet fileprivate var label:        UILabel?

    @IBOutlet fileprivate var dataSource:   DemoDataSource?

    //MARK: - Init functions
    override func awakeFromNib() {
        super.awakeFromNib()

        self.dataSource?.add(listener: self)
    }

    //MARK: - DemoDataSourceListener functions
    func newDataReceived(_ data: String) {
        self.label?.text = data
    }

}

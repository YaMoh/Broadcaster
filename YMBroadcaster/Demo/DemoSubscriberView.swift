//
//  DemoSubscriberView.swift
//  YMBroadcaster
//
//  Created by Yaser on 16/07/16.
//  Copyright © 2016 Bespoke Code AB. All rights reserved.
//

import UIKit

class DemoSubscriberView: UIView, DemoDataSourceListener {

    @IBOutlet private var label:        UILabel?

    @IBOutlet private var dataSource:   DemoDataSource?

    //MARK: - Init functions
    override func awakeFromNib() {
        super.awakeFromNib()

        self.dataSource?.addListener(self)
    }

    //MARK: - DemoDataSourceListener functions
    func newDataReceived(data: String) {
        self.label?.text = data
    }

}
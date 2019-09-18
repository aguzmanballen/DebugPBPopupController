//
//  MiniPlayerViewController.swift
//  Audiate
//
//  Created by Andres Guzman-Ballen on 9/12/19.
//  Copyright © 2019 Cosmic Flamingo. All rights reserved.
//

import UIKit

class MiniPlayerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        preferredContentSize = CGSize(width: -1, height: 50)
        self.view.preservesSuperviewLayoutMargins = true

        view.backgroundColor = UIColor.lightGray
    }
}

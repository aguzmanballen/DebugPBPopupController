//
//  PlayerViewController.swift
//  Audiate
//
//  Created by Andres Guzman-Ballen on 9/12/19.
//  Copyright © 2019 Cosmic Flamingo. All rights reserved.
//
//  Lots of help from the following:
//    https://www.raywenderlich.com/221-recreating-the-apple-music-now-playing-transition

import PBPopupController
import UIKit

class PlayerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Round corners so it looks like a nice card
        view.layer.cornerRadius = 20.0
        view.layer.masksToBounds = true

        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
}

//
//  ListenViewController.swift
//  Audiate
//
//  Created by Andres Guzman-Ballen on 9/12/19.
//  Copyright © 2019 Cosmic Flamingo. All rights reserved.
//

import SnapKit
import UIKit

class ListenViewController: UIViewController {
    
    // MARK: - Properties

    var testButton: UIButton = {
        let button = UIButton()
        return button
    }()
    var playerVC: PlayerViewController = {
        let vc = PlayerViewController()
        return vc
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()

        initialSetup()
        view.backgroundColor = UIColor.white
    }

    // MARK: - UI

    func initialSetup() {

        view.addSubview(testButton)
        testButton.backgroundColor = UIColor.black
        testButton.snp.makeConstraints{ (make) -> Void in
            make.centerY.equalTo(view)
            make.centerX.equalTo(view).multipliedBy(0.5)
            make.size.equalTo(CGSize(width: 50.0, height: 50.0))
        }
        testButton.addTarget(self, action: #selector(didPressButton(_:)), for: .touchUpInside)
    }

    @objc func didPressButton(_ sender: UIButton) {

        self.tabBarController?.presentPopupBar(withPopupContentViewController: playerVC, animated: true, completion: {
            print("Presented")
        })
    }
}

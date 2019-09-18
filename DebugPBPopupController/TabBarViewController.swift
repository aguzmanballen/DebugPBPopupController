//
//  TabBarViewController.swift
//  DebugPBPopupController
//
//  Created by Andres Guzman-Ballen on 9/18/19.
//  Copyright © 2019 CosmicFlamingo. All rights reserved.
//

import PBPopupController
import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    // MARK: - Properties

    // General properties
    private var themedStatusBarStyle: UIStatusBarStyle?
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return themedStatusBarStyle ?? super.preferredStatusBarStyle
    }
    let miniPlayerVC: MiniPlayerViewController = {
        let vc = MiniPlayerViewController()
        return vc
    }()

    // Tab bar view controllers
    var listenViewController: ListenViewController = {
        let vc = ListenViewController()
        let image_Portrait = UIImage(named: "ListenIcon_Portrait")?.resizableImage(withCapInsets: .zero)
        let image_Landscape = UIImage(named: "ListenIcon_Landscape")?.resizableImage(withCapInsets: .zero)
        vc.tabBarItem = UITabBarItem(title: "Listen", image: image_Portrait, tag: 0)
        vc.tabBarItem.landscapeImagePhone = image_Landscape
        return vc
    }()
    var rhythmViewController: UIViewController = {
        let vc = UIViewController()
        let image_Portrait = UIImage(named: "RhythmIcon_Portrait")?.resizableImage(withCapInsets: .zero)
        let image_Landscape = UIImage(named: "RhythmIcon_Landscape")?.resizableImage(withCapInsets: .zero)
        vc.tabBarItem = UITabBarItem(title: "Rhythm", image: image_Portrait, tag: 3)
        vc.tabBarItem.landscapeImagePhone = image_Landscape
        return vc
    }()
    var optionsViewController: UIViewController = {
        let vc = UIViewController()
        let image_Portrait = UIImage(named: "OptionsIcon_Portrait")?.resizableImage(withCapInsets: .zero)
        let image_Landscape = UIImage(named: "OptionsIcon_Landscape")?.resizableImage(withCapInsets: .zero)
        vc.tabBarItem = UITabBarItem(title: "Options", image: image_Portrait, tag: 4)
        vc.tabBarItem.landscapeImagePhone = image_Landscape
        return vc
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()

        initialSetup()
        setupTabBar()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        setupPBBar()
    }

    // MARK: - UI

    func initialSetup() {

        self.delegate = self

        let viewControllerList = [
            listenViewController,
            rhythmViewController,
            optionsViewController
        ]
        viewControllers = viewControllerList
        self.tabBarController?.selectedIndex = 0
    }

    func setupTabBar() {

        // Setup font
        let tabBarFont: UIFont = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)

        let uiTabBarItem = UITabBarItem.appearance()
        uiTabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: tabBarFont], for: .normal)
    }
}

extension TabBarViewController: PBPopupControllerDelegate, PBPopupBarDataSource {

    func setupPBBar() {

        if let popupController = self.popupController {
            popupController.delegate = self
        }
        if let popupContentView = self.popupContentView {
            popupContentView.popupPresentationStyle = .fullScreen
            popupContentView.popupCloseButtonStyle = .chevron

            // Remove unwanted blur
            popupContentView.popupEffectView.effect = nil
        }
        if let popupBar = self.popupBar {
            //popupBar.dataSource = self
            popupBar.PBPopupBarShowColors = false
            popupBar.dataSource = self

            //popupBar.inheritsVisualStyleFromBottomBar = true

            popupBar.shadowImageView.shadowOpacity = 0
            popupBar.customPopupBarViewController = miniPlayerVC
        }
    }
}

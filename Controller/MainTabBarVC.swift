//
//  MainTabBarVC.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 31/08/2021.
//

import UIKit

class MainTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        changeBarApperanceStyle()

    }
    func changeBarApperanceStyle(){
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = #colorLiteral(red: 0.1586136818, green: 0.2254219353, blue: 0.4047384262, alpha: 1)
        self.tabBar.unselectedItemTintColor = .gray
    }

}

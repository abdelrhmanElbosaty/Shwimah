//
//  HomeMainNavigationControllerVC.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 03/09/2021.
//

import UIKit

class HomeMainNavigationControllerVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

       // changeBarApperanceStyle()
    }
    
    func changeBarApperanceStyle(){
            let style = UINavigationBarAppearance()
            style.backgroundColor = #colorLiteral(red: 0.1599657834, green: 0.2374417782, blue: 0.4208174348, alpha: 1)
            style.shadowColor = .clear
            self.navigationBar.standardAppearance = style
            self.navigationBar.scrollEdgeAppearance = style
            self.navigationBar.compactAppearance = style
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        
    }

}

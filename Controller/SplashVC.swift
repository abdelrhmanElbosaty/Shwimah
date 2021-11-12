//
//  SplashVC.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 31/08/2021.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        perform(#selector(self.goNext), with: nil, afterDelay: 0.2)
    }
   

    @objc func goNext(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ChooseLanguageVC") as! ChooseLanguageVC
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
}

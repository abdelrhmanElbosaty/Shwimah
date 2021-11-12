//
//  SceneDelegate.swift
//  Shwimah
//
//  Created by abdurhman elbosaty on 31/08/2021.
//

import UIKit
//import MOLH

class SceneDelegate: UIResponder, UIWindowSceneDelegate /*, MOLHResetable */{
  

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
   
        // MOLH Use
//        MOLH.shared.activate(true)
//        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "en" : "en")
//        MOLH.setLanguageTo(MOLHLanguage.setDefaultLanguage("en"))
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    // MOLH Use
    
//    func reset() {
//       // let root: UIWindow = (UIApplication.shared.delegate?.window)!!
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTabBarVC")
//        swapCurrentViewController(with: vc)
//
////        UIView.transition(with: window!, duration: 5, options: .transitionFlipFromLeft, animations: {
////            self.window?.rootViewController = vc
////          //  self.window?.rootViewController?.view.removeFromSuperview()
////
////
////            self.window?.makeKeyAndVisible()
////        }, completion: nil)
//
//    }
//    private func swapCurrentViewController(with newViewController: UIViewController,
//                                           animated: Bool = true,
//                                           duration: TimeInterval = 1) {
//
//        // Get a reference to the window's current `rootViewController` (the "old" one)
//        let oldViewController = window?.rootViewController
//
//        // Replace the window's `rootViewController` with the new one
//        window?.rootViewController = newViewController
//
//        if animated, let oldView = oldViewController?.view {
//
//            // Add the old view controller's view on top of the new `rootViewController`
//            newViewController.view.addSubview(oldView)
//
//            // Remove the old view controller's view in an animated fashion
//            UIView.transition(with: window!,
//                              duration: duration,
//                              options: .transitionFlipFromLeft,
//                              animations: { oldView.removeFromSuperview() },
//                              completion: nil)
//        }
//    }
}


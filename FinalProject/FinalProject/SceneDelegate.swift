//
//  SceneDelegate.swift
//  FinalProject
//
//  Created by Александра Захаревич on 11.06.22.
//

import UIKit
import VK_ios_sdk

class SceneDelegate: UIResponder, UIWindowSceneDelegate, AuthServiceDelegate {

    var window: UIWindow?
    var authService: AuthService!
    
    static func shared() -> SceneDelegate {
        let scene = UIApplication.shared.connectedScenes.first
        let sd: SceneDelegate = (((scene?.delegate as? SceneDelegate)!))
        return sd
    }


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        authService = AuthService()
        authService.delegate = self
//        let loginVC = UIStoryboard(name: "LoginVC", bundle: nil).instantiateInitialViewController() as? LoginVC
        window?.rootViewController = UINavigationController(rootViewController: LoginVC(nibName: String(describing: LoginVC.self), bundle: nil))
//        window?.rootViewController = loginVC
        window?.makeKeyAndVisible()
    }
 
//    guard let windowScene = (scene as? UIWindowScene) else { return }
//    window = UIWindow(windowScene: windowScene)
//    window?.windowScene = windowScene
//    window?.rootViewController = UINavigationController(rootViewController: MapVC(nibName: String(describing: MapVC.self), bundle: nil))
//    window?.makeKeyAndVisible()
//    
    
    
    
    // MARK: AuthServiceDelegate
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            VKSdk.processOpen(url, fromApplication: UIApplication.OpenURLOptionsKey.sourceApplication.rawValue)
        }
    }
    
    func authServiceShould(viewController: UIViewController) {
        print(#function)
        window?.rootViewController?.present(viewController, animated: true, completion: nil)
    }
    
    func authServiceSingIn() {
        print(#function)
//        let tabbar = UIStoryboard(name: "TabBarController", bundle: nil).instantiateInitialViewController() as! TabBarController
        window?.rootViewController = TabBarController()
//        feedVC.modalPresentationStyle = .fullScreen
//        let navVC = UINavigationController(rootViewController: tabbar)
//        window?.rootViewController = navVC
    }
    
    func authServiceSingInDidFail() {
        print(#function)
    }

}


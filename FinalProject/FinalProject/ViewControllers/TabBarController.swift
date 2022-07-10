//
//  TabBarController.swift
//  FinalProject
//
//  Created by Александра Захаревич on 12.06.22.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupcontrollers()
    }
    
    private func setupcontrollers() {
//        let mainVC = UINavigationController(rootViewController: MainVC(nibName: String(describing: MainVC.self), bundle: nil))
        let mainVC = UINavigationController(rootViewController: MainVC(nibName: String(describing: MainVC.self), bundle: nil))
        let profileVC = UINavigationController(rootViewController: ProfileVC(nibName: String(describing: ProfileVC.self), bundle: nil))
//        let profileVC = UINavigationController(rootViewController: PhotoGaleryVC(nibName: String(describing: PhotoGaleryVC.self), bundle: nil))
        let myGroupsVC = UINavigationController(rootViewController: MyGroupsVC(nibName: String(describing: MyGroupsVC.self), bundle: nil))
        let myFrendsVC = UINavigationController(rootViewController: MyFrendsVC(nibName: String(describing: MyFrendsVC.self), bundle: nil))
    
        
        
        mainVC.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(named: "Main"), tag: 0)
        profileVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "Profile"), tag: 1)
        myFrendsVC.tabBarItem = UITabBarItem(title: "Друзья", image: UIImage(named: "Friends"), tag: 2)
        myGroupsVC.tabBarItem = UITabBarItem(title: "Сообщества", image: UIImage(named: "Groups"), tag: 3)

        UITabBar.appearance().tintColor = UIColor.purple.withAlphaComponent(0.5)
        self.viewControllers = [mainVC, profileVC, myFrendsVC, myGroupsVC]
    }

}

//
//  LoginVC.swift
//  FinalProject
//
//  Created by Александра Захаревич on 19.06.22.
//

import UIKit

class LoginVC: UIViewController {

    private var authService: AuthService!
    
    
    // login: +375 44 537 85 69, password: alexandra1990
    override func viewDidLoad() {
        super.viewDidLoad()
        authService = SceneDelegate.shared().authService
//        view.backgroundColor = .systemFill
    }


    @IBAction func loginAction(_ sender: Any) {
        authService.wakeUpSession()
    }
    
}

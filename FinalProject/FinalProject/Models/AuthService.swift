//
//  AuthService.swift
//  FinalProject
//
//  Created by Александра Захаревич on 22.06.22.
//

import Foundation
import VK_ios_sdk

protocol AuthServiceDelegate: AnyObject {
    func authServiceShould(viewController: UIViewController)
    func authServiceSingIn()
    func authServiceSingInDidFail()
}

class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {
   
    private let appId = "8198223"
    private let vkSdk: VKSdk
    
    var userId: String? {
        return VKSdk.accessToken()?.userId
    }
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appId)
        super.init()
        print("VKSdk.initialize")
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    weak var delegate: AuthServiceDelegate?
    
    var token: String? {
        return VKSdk.accessToken()?.accessToken
    }
    
    func wakeUpSession() {
        let scope = ["wall", "friends", "photos"]
        VKSdk.wakeUpSession(scope) {[delegate] state, error in
            switch state {
            case.initialized:
                print("initialized")
                VKSdk.authorize(scope)
            case .authorized:
                print("authorized")
                delegate?.authServiceSingIn()
            default:
                delegate?.authServiceSingInDidFail()
            }
        }
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        if result.token != nil {
            delegate?.authServiceSingIn()
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
        delegate?.authServiceSingInDidFail()
    }
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate?.authServiceShould(viewController: controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
}

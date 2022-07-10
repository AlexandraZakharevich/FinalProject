//
//  ProfileVC.swift
//  FinalProject
//
//  Created by Александра Захаревич on 12.06.22.
//

import UIKit

class ProfileVC: UIViewController {
    @IBOutlet weak var nameProfileView: UIView!
    @IBOutlet weak var infoView: UIView!
    
    @IBOutlet weak var photoProfileImage: UIImageView!
    @IBOutlet weak var nameProfilleLabel: UILabel!
    @IBOutlet weak var statusProfileLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "Id"
        
        photoProfileImage.layer.cornerRadius = photoProfileImage.frame.height / 2
        nameProfileView.layer.cornerRadius = 8
        nameProfileView.backgroundColor = .white
        
        infoView.layer.cornerRadius = 8
        infoView.backgroundColor = .white

        
    }


    

}

//
//  MoreInfoVC.swift
//  FinalProject
//
//  Created by Александра Захаревич on 11.07.22.
//

import UIKit

class MoreInfoVC: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var bDate: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var folowersLabel: UILabel!
    @IBOutlet weak var friendsLabel: UILabel!
    @IBOutlet weak var groupsLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Подробнее"
        
    }


    @IBAction func shoeFriedsAction(_ sender: Any) {
        let friendsVC = MyFrendsVC(nibName: String(describing: MyFrendsVC.self), bundle: nil)
        navigationController?.pushViewController(friendsVC, animated: true)
        
    }
    

    @IBAction func showGruopsAction(_ sender: Any) {
        let gruopsVC = MyGroupsVC(nibName: String(describing: MyGroupsVC.self), bundle: nil)
        navigationController?.pushViewController(gruopsVC, animated: true)
    }
    
}

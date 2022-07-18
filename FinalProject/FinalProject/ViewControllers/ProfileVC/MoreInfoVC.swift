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
    
    var profile: ProfileResponse?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Подробнее"
        
        
        NetworkManager.getProfile { result in
            self.profile = result[0]
            self.setupMoreInfo()
            print("You get profile")
        } failure: {
            print("You  don't get profile")
        }
        
    }
    
    func setupMoreInfo(){
        guard let profile = self.profile else {return}

        
        if let followers = profile.followersCount {
            folowersLabel.text = "Подписчики: \(followers)"
        } else {
            folowersLabel.text  = "Подписчики: нет"
        }
        
        
        statusLabel.text = profile.status != nil ? profile.status : "Статус: не указан"
        cityLabel.text = profile.city?.title != nil ? profile.city!.title : "Город: не указано"
        bDate.text = profile.bdate != nil ? profile.bdate : "Дата Рождения не указана"
      
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

//extension MoreInfoVC: UITableViewDelegate{
//    
//}

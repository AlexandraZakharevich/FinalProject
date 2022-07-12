//
//  MyFrendsVC.swift
//  FinalProject
//
//  Created by Александра Захаревич on 12.06.22.
//

import UIKit
import Foundation

class MyFrendsVC: UIViewController {
    
    var friendsCount: FriendsResponse?
    var friensName: FriendItem?
    
   
    

    @IBOutlet weak var friendTable: UITableView!
    
//    private var searchField = InsetableTextField()
    
     var searchController =  UISearchController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        friendTable.delegate = self
        friendTable.dataSource = self
        
        friendTable.register(UINib(nibName: String(describing: FriendsAndGroupCell.self), bundle: nil), forCellReuseIdentifier: String(describing: FriendsAndGroupCell.self))

        friendTable.backgroundColor  = .clear
//        self.tabBarController?.navigationItem.titleView?.removeFromSuperview()
//        self.tabBarController?.navigationItem.title?.removeAll()
        addSearch()
        
       

    }
    
    private func addSearch() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.setValue("Отмена", forKey: "cancelButtonText")
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
        
    }
   

}


extension MyFrendsVC : UITableViewDelegate {
  
    
}

extension MyFrendsVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = friendTable.dequeueReusableCell(withIdentifier: String(describing: FriendsAndGroupCell.self), for: indexPath)
as! FriendsAndGroupCell
        cell.photoImage.layer.cornerRadius = cell.photoImage.frame.height / 2
        cell.viewCell.layer.cornerRadius = 20
        cell.selectionStyle = .none
//        cell.nameLabel = friensName[indexPath.row].

        
        return cell
        
    }
    
}

extension MyFrendsVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}

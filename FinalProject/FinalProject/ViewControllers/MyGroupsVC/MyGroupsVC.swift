//
//  MyGroupsVC.swift
//  FinalProject
//
//  Created by Александра Захаревич on 12.06.22.
//

import UIKit
import Foundation

class MyGroupsVC: UIViewController {
    @IBOutlet weak var groupTable: UITableView!
    
    var groups = [Groups]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupTable.delegate = self
        groupTable.dataSource = self
        
        groupTable.register(UINib(nibName: String(describing: FriendsAndGroupCell.self), bundle: nil), forCellReuseIdentifier: String(describing: FriendsAndGroupCell.self))

        groupTable.backgroundColor = .clear
       
        
    
    
    NetworkManager.getGroups { groups in
        self.groups = groups
        self.groupTable.reloadData()
        print("You get groups")
    } failure: {
        print("You  don't get groups")
    }

}
}

extension MyGroupsVC: UITableViewDelegate {
    
}

extension MyGroupsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = groupTable.dequeueReusableCell(withIdentifier: String(describing: FriendsAndGroupCell.self), for: indexPath) as! FriendsAndGroupCell
        cell.setupgroupCell(cel: groups[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}


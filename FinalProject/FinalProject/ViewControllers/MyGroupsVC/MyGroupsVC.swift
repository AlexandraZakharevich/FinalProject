//
//  MyGroupsVC.swift
//  FinalProject
//
//  Created by Александра Захаревич on 12.06.22.
//

import UIKit

class MyGroupsVC: UIViewController {
    @IBOutlet weak var groupTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupTable.delegate = self
        groupTable.dataSource = self
        
        groupTable.register(UINib(nibName: String(describing: FriendsAndGroupCell.self), bundle: nil), forCellReuseIdentifier: String(describing: FriendsAndGroupCell.self))

        
      
    }

}

extension MyGroupsVC: UITableViewDelegate {
    
}

extension MyGroupsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = groupTable.dequeueReusableCell(withIdentifier: String(describing: FriendsAndGroupCell.self), for: indexPath) as! FriendsAndGroupCell
        cell.photoImage.layer.cornerRadius = cell.photoImage.frame.height / 2
        
        return cell
    }
    
    
}

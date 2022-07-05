//
//  FriendsAndGroupCell.swift
//  FinalProject
//
//  Created by Александра Захаревич on 5.07.22.
//

import UIKit

class FriendsAndGroupCell: UITableViewCell {
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImage.layer.cornerRadius = 15
        
    }

   
    
}

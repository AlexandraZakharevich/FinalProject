//
//  FriendsAndGroupCell.swift
//  FinalProject
//
//  Created by Александра Захаревич on 5.07.22.
//

import UIKit
import SDWebImage

class FriendsAndGroupCell: UITableViewCell {
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var viewCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
        
        
    }
    func setupfriendCell(cel: Friends) {
        guard let firstname = cel.first_name,
              let lastname = cel.last_name else {return}
        
        nameLabel.text = "\(firstname) \(lastname)"
        
        if let status = cel.status {
            statusLabel.text = status
        } else {
            statusLabel.text = ""
        }
        
        if let photo = cel.photo_200_orig {
//            photoImage.setImageFromUrl(photo)
            photoImage.sd_setImage(with: URL(string: photo))
            photoImage.contentMode = .scaleAspectFill
            photoImage.layer.cornerRadius = photoImage.frame.height / 2
            viewCell.layer.cornerRadius = 20
        }
        
        
    }
    
    func setupgroupCell(cel: Groups) {
        guard let name = cel.name else {return}
        
        nameLabel.text = name
        
        if let status = cel.status {
            statusLabel.text = status
        } else {
            statusLabel.text = ""
        }
        
        if let photo = cel.photo_100{
//            photoImage.setImageFromUrl(photo)
            photoImage.sd_setImage(with: URL(string: photo))
            photoImage.contentMode = .scaleAspectFill
            photoImage.layer.cornerRadius = photoImage.frame.height / 2
            viewCell.layer.cornerRadius = 20
        }
        
        
    }
   
    override func prepareForReuse() {
        photoImage.image = nil
    }
    }
    


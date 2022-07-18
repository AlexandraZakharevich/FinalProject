//
//  FriendCollectionCell.swift
//  FinalProject
//
//  Created by Александра Захаревич on 11.07.22.
//

import UIKit
import SDWebImage

class FriendCollectionCell: UICollectionViewCell {

    @IBOutlet weak var friendCollectionImage: UIImageView!
    @IBOutlet weak var friendNameCollectionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setupcollectionCell(cel: Friends) {
        guard let firstname = cel.first_name,
              let lastname = cel.last_name else {return}
        
        friendNameCollectionLabel.text = "\(firstname) \(lastname)"
        
        
        if let photo = cel.photo_200_orig {
//            photoImage.setImageFromUrl(photo)
            friendCollectionImage.sd_setImage(with: URL(string: photo))
            friendCollectionImage.contentMode = .scaleAspectFill
            friendCollectionImage.layer.cornerRadius =  friendCollectionImage.frame.height / 2
            
        }
        
        
    }
}

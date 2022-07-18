//
//  PhotoCell.swift
//  FinalProject
//
//  Created by Александра Захаревич on 8.07.22.
//

import UIKit

class PhotoCell: UICollectionViewCell {

    @IBOutlet weak var imageViewCell: UIImageView!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewCell.contentMode = .scaleAspectFill
//        imageViewCell.image = images.randomElement()
//
        imageViewCell.clipsToBounds = true
       

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageViewCell.frame = contentView.bounds
    }
    
    func setupCell(url: Urls){
        if let photoUrl = url.url {
           imageViewCell.setImageFromUrl(photoUrl)
        }
        
    }
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        imageViewCell.image = nil
//
//    }
}




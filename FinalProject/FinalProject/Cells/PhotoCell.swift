//
//  PhotoCell.swift
//  FinalProject
//
//  Created by Александра Захаревич on 8.07.22.
//

import UIKit
import SDWebImage

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
    
    func setupGalleryCell(url: Photos){
        if let photoUrl = url.sizes[0].url {
            imageViewCell.sd_setImage(with: URL(string: photoUrl))
        }
        
    }
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        imageViewCell.image = nil
//
//    }
}




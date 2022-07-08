//
//  PhotoCell.swift
//  FinalProject
//
//  Created by Александра Захаревич on 8.07.22.
//

import UIKit

class PhotoCell: UICollectionViewCell {

    @IBOutlet weak var imageViewCell: UIImageView!
    
    let images = [
        UIImage(named: "image1"),
        UIImage(named: "image2"),
        UIImage(named: "image3")].compactMap({$0})
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewCell.contentMode = .scaleAspectFill
        imageViewCell.image = images.randomElement()
       
        imageViewCell.clipsToBounds = true
       

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageViewCell.frame = contentView.bounds
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        imageViewCell.image = nil
//    }
}




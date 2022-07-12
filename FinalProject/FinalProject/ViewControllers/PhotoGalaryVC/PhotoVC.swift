//
//  PhotoVC.swift
//  FinalProject
//
//  Created by Александра Захаревич on 9.07.22.
//

import UIKit

class PhotoVC: UIViewController {

    var selectedIndex: Int = 0
//    var imageArr: it
    
    fileprivate let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.contentMode = .scaleAspectFit
        sv.showsVerticalScrollIndicator = false
        sv.showsHorizontalScrollIndicator = false
        sv.backgroundColor = .black
        sv.minimumZoomScale = 1
        sv.maximumZoomScale = 6
        return sv
    }()
    
    fileprivate let img: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    fileprivate let closeButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "arrow.left")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
        
    }()
    
    fileprivate let countLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstrains()
       
        
    }
    
    func setupView() {
        view.backgroundColor = .black
//        scrollView.delegate = self
        view.addSubview(scrollView)
        scrollView.addSubview(img)
        view.addSubview(countLabel)
        view.addSubview(closeButton)
    }
    
    func setupConstrains() {
        scrollView.frame = view.bounds
        img.frame = scrollView.bounds
        
        closeButton.frame = CGRect(x: 20, y: (self.navigationController?.navigationBar.frame.size.height)!, width: 25, height: 25)
    }
    
    func loadImage() {
//        img.image = imageArr[selectedIndex].image
//        countLabel.text = String(format: "%ld / %ld", selectedIndex + 1, imageArr.count)
        
    }
    @objc func closeButtonTapped() {
        
    }

    

}

//
//  ViewController.swift
//  FinalProject
//
//  Created by Александра Захаревич on 11.06.22.
//
//
//import UIKit
//
//
//
//class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource   {
//    
//    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout() )
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        view.addSubview(collectionView)
//        
//        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
//
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        collectionView.frame = view.bounds
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 30
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath)
//        return cell
//    }
//}


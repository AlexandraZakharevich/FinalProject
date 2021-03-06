//
//  PhotoGaleryVC.swift
//  FinalProject
//
//  Created by Александра Захаревич on 12.06.22.
//

import UIKit


class PhotoGaleryVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    @IBOutlet weak var collectionView: UICollectionView!

    var profileGallery = [Photos]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Фотографии"
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Arial", size: 25)!]
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white

        
        collectionView.register(UINib(nibName: String(describing: PhotoCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: PhotoCell.self))
        collectionView.collectionViewLayout = PhotoGaleryVC.createLayout()
      
//        collectionView.reloadData()
      
        NetworkManager.getPhotos { result in
            self.profileGallery = result
            self.collectionView.reloadData()
//            self.setupProfile()
            print("You get photos")
        } failure: {
            print("You  don't get photos")
        }
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        collectionView.frame = view.bounds
//    }
    // 1. Ниже способ через композицию
    static func createLayout() -> UICollectionViewCompositionalLayout {

        // Item
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), //2/3
                                                                             heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        
        let verticalStackItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                          heightDimension: .fractionalHeight(0.5)))
        
        verticalStackItem.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        
        let verticalStackGroup = NSCollectionLayoutGroup.vertical (
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3),
                                               heightDimension: .fractionalHeight(1)),
                                               subitem: verticalStackItem,
                                               count: 2)
        
        let tripletItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1)))
        
        tripletItem.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        
        let tripletHorizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1)),
            subitem: tripletItem, count: 2)
        
//        tripletHorizontalGroup.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        //Group
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                                                    heightDimension: .fractionalWidth(0.7)),
                                                       subitems: [item, verticalStackGroup])
        
        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                                                heightDimension: .fractionalHeight(1)),
                                                             subitems: [ horizontalGroup, tripletHorizontalGroup])
        
       
        
        //Sections
        let section = NSCollectionLayoutSection(group: verticalGroup)

       
        
        //Return
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileGallery.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PhotoCell.self), for: indexPath) as! PhotoCell
        cell.setupGalleryCell(url: profileGallery[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let onePhotoVC = OnePhotoVC(nibName: String(describing: OnePhotoVC.self), bundle: nil)
        onePhotoVC.photos = profileGallery[indexPath.row]
//        onePhotoVC.photos = UIImageView(image: photo) //photo
//        navigationController?.pushViewController(onePhotoVC, animated: true)
        present(onePhotoVC, animated: true)
        
        
    }
        // 2. Ниже простой колекшн с фото
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: (view.frame.size.width / 3) - 3,
//                      height: (view.frame.size.width / 3) - 3)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 4
//    }
////
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("Выбрана секция \(indexPath.section) и строка \(indexPath.row)")
//    }
}

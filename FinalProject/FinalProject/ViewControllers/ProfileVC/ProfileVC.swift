//
//  ProfileVC.swift
//  FinalProject
//
//  Created by Александра Захаревич on 12.06.22.
//

import UIKit


protocol UserPhoto {
    var photoUrlString: String? { get }
}

class ProfileVC: UIViewController {
    @IBOutlet weak var nameProfileView: UIView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var friendView: UIView!
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var postView: UIView!
    
    @IBOutlet weak var photoProfileImage: UIImageView!
    
   
    @IBOutlet weak var nameProfilleLabel: UILabel!
    @IBOutlet weak var statusProfileLabel: UILabel!
    
    @IBOutlet weak var postCollectionView: UICollectionView!
    @IBOutlet weak var friendCollectionView: UICollectionView!
    
    private let authService = AuthService()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        guard let useriD = authService.userId else {return}
//        self.title = "id\(useriD)"
//        self.tabBarController?.title = "fhm"
        
        photoProfileImage.layer.cornerRadius = photoProfileImage.frame.height / 2

        nameProfileView.layer.cornerRadius = 8
        nameProfileView.backgroundColor = .white
        
        infoView.layer.cornerRadius = 8
        infoView.backgroundColor = .white
        
        friendView.layer.cornerRadius = 8
        friendView.backgroundColor = .white
        
        photoView.layer.cornerRadius = 8
        photoView.backgroundColor = .white
        
        postView.layer.cornerRadius = 8
        postView.backgroundColor = .white
        postCollectionView.layer.cornerRadius = 8
        postCollectionView.backgroundColor = .white
        
        friendCollectionView.dataSource = self
        friendCollectionView.delegate = self
        friendCollectionView.register(UINib(nibName: String(describing: FriendCollectionCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: FriendCollectionCell.self))
        
        
       
        
       
        
        
        

    }
    
    

    @IBAction func showGalleryAction(_ sender: Any) {
        let galeeryVC = PhotoGaleryVC(nibName: String(describing: PhotoGaleryVC.self), bundle: nil)
        navigationController?.pushViewController(galeeryVC, animated: true)
    }
    
    @IBAction func showFriendTableAction(_ sender: Any) {
        let friendVC = MyFrendsVC(nibName: String(describing: MyFrendsVC.self), bundle: nil)
        navigationController?.pushViewController(friendVC, animated: true)
    }
    
    

}

extension ProfileVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 20
        
     
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = friendCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FriendCollectionCell.self), for: indexPath) as! FriendCollectionCell
        cell.friendCollectionImage.layer.cornerRadius = cell.friendCollectionImage.frame.height / 2
        return cell
    }
    
    
}

extension ProfileVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == friendCollectionView {
            return CGSize(width: 120, height: 90)
        }
        return .zero
    }
}


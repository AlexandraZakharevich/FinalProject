//
//  ProfileVC.swift
//  FinalProject
//
//  Created by Александра Захаревич on 12.06.22.
//

import UIKit


//protocol UserPhoto {
//    var photoUrlString: String? { get }
//}

class ProfileVC: UIViewController {
    @IBOutlet weak var nameProfileView: UIView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var friendView: UIView!
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var postView: UIView!
    
    @IBOutlet weak var photoProfileImage: UIImageView!
    
   
    @IBOutlet weak var nameProfilleLabel: UILabel!
    @IBOutlet weak var statusProfileLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var educationLabel: UILabel!
    @IBOutlet weak var subcribesLabel: UILabel!
    @IBOutlet weak var workPlaceLabel: UILabel!
    
    
    @IBOutlet weak var postCollectionView: UICollectionView!
    @IBOutlet weak var friendCollectionView: UICollectionView!
    
    var profile: ProfileResponse?
    var friends  = [Friends]()
    
    
    
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
        
        
       

        NetworkManager.getProfile { result in
            self.profile = result[0]
            self.setupProfile()
            print("You get profile")
        } failure: {
            print("You  don't get profile")
        }
        
        NetworkManager.getFriends { friends in
            self.friends = friends
            self.friendCollectionView.reloadData()
            
            print("You get friends")
        } failure: {
            print("You  don't get friends")
        }

        
        
        

    }
    
    func setupProfile(){
        guard let profile = self.profile else {return}
        guard let firstName = profile.firstName,
              let lastName = profile.lastName else {return}
        nameProfilleLabel.text = "\(firstName) \(lastName)"
        
        if let status = profile.status {
            statusProfileLabel.text = status
        } else {
        statusProfileLabel.text = ""
        }
        
        if let followers = profile.followersCount {
            subcribesLabel.text = "Подписчики: \(followers)"
        } else {
            subcribesLabel.text = "Подписчики: нет"
        }
        
        if let  photoProfile = profile.photo100 {
            photoProfileImage.setImageFromUrl(photoProfile)
        }
        
        cityLabel.text = profile.city?.title != nil ? profile.city!.title : "Город: не указано"
        educationLabel.text = profile.universityName != nil ? profile.universityName : "Oбразование: не указано"
//        subcribesLabel.text = profile.followersCount != nil ? profile.followersCount : "Подписчиков нет"
        
        
    }
    
    

    @IBAction func showGalleryAction(_ sender: Any) {
        let galeeryVC = PhotoGaleryVC(nibName: String(describing: PhotoGaleryVC.self), bundle: nil)
        navigationController?.pushViewController(galeeryVC, animated: true)
    }
    
    @IBAction func showFriendTableAction(_ sender: Any) {
        let friendVC = MyFrendsVC(nibName: String(describing: MyFrendsVC.self), bundle: nil)
        navigationController?.pushViewController(friendVC, animated: true)
    }
    
    @IBAction func showMoreInfoAction(_ sender: Any) {
        let moreInfoVC = UINavigationController(rootViewController: MoreInfoVC(nibName: String(describing: MoreInfoVC.self), bundle: nil))
        present(moreInfoVC, animated: true)
    }
    

}

extension ProfileVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friends.count
        
     
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = friendCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FriendCollectionCell.self), for: indexPath) as! FriendCollectionCell
        cell.friendCollectionImage.layer.cornerRadius = cell.friendCollectionImage.frame.height / 2
        cell.setupcollectionCell(cel: friends[indexPath.row])
        
        return cell
    }
    
    
}

extension ProfileVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == friendCollectionView {
            return CGSize(width: 85, height: 110)
        }
        return .zero
    }
}




//
//  ProfileController.swift
//  Prefe
//
//  Created by Edward Joon-Hyuk Chang on 03/11/2016.
//  Copyright © 2016 Prefe. All rights reserved.
//

import UIKit

class ProfileController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var mainController: TabBarController?
    var colView: UICollectionView!
    
    private let cellId = "CellId"
    private let headerId = "HeaderId"
    
    var user = User()
    var posts = [Post]()
    let rowSize: CGFloat = 210
    var numDetailTextLines = 0
    let nameTextFontSize:CGFloat = 12.0
    let detailTextFontSize:CGFloat = 10.0
    var pictureHeight: CGFloat = 250.0
    let maxCharInLine = 57
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainController?.changeSelected(select: 4)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: pictureHeight, height: pictureHeight+40)
        
        colView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        colView.delegate   = self
        colView.dataSource = self
        colView.register(MyPostCell.self, forCellWithReuseIdentifier: cellId)
        colView.backgroundColor = UIColor.white
        colView.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        
        fetchUser()
        fetchPosts()
        
        determineLineLength()
        setupViews()
    }
    
    func determineLineLength(){
        if user.bio != nil {
            let text = user.bio!
            numDetailTextLines += 1
            let length:Int = (text.utf16.count)
            var numCharsAfterNL = 0
            for i in 0..<length {
                if text[text.index(text.startIndex, offsetBy: i)] == "\n" {
                    numDetailTextLines += 1
                    numCharsAfterNL = 0
                }
                else {
                    numCharsAfterNL += 1
                }
                if numCharsAfterNL == maxCharInLine {
                    numDetailTextLines += 1
                    numCharsAfterNL = 0
                }
            }
        }
        if user.organization != nil {
            numDetailTextLines += 1
        }
        print(numDetailTextLines)
    }
    
    func setupViews() {
        setupNavBar()
        
        self.view.addSubview(colView)
    }
    
    func setupNavBar(){
        var friendsImage=UIImage(named: "findFriends.png")
        friendsImage = friendsImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        mainController?.navigationItem.leftBarButtonItem = UIBarButtonItem(image: friendsImage, style: .plain, target: self, action: #selector(handleFindFriends))
        var settingsImage=UIImage(named: "settings.png")
        settingsImage = settingsImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        mainController?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: settingsImage, style: .plain, target: self, action: #selector(handleSettings))
    }
    
    func handleFindFriends(){
        
    }
    
    func handleSettings(){
        
    }
    
    func fetchUser() {
        user.name = "Edward Chang"
        user.bio = "UCLA Class of 2019\nB.S. Computer Science"
        user.organization = "PREFE"
        user.profilePictureUrl = "www.facebook.com/edward.chang.520"
    }
    
    func fetchPosts(){
        let post = Post()
        post.posterID = "Edward Chang"
        post.caption = "Profile Picture"
        post.timestamp = "Today"
        post.url = "My link"
        
        self.posts.append(post)
        self.posts.append(post)
        self.posts.append(post)
        self.posts.append(post)
        self.posts.append(post)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyPostCell
        cell.pictureHeight = self.pictureHeight
        cell.setupViews()
        cell.textLabel.text = "Edward Chang"
        cell.detailTextLabel.text = "Caption"
        cell.postImageView.image = UIImage(named: "me")
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: CGFloat(123+12*numDetailTextLines))
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! ProfileHeader
        header.backgroundColor = UIColor.white
        header.textLabel.text = user.name
        if(user.bio != nil) {
            if(user.organization != nil) {
                header.bioTextLabel.text = user.bio!+"\n"+user.organization!
            }
            else {
                header.bioTextLabel.text = user.bio
            }
        }
        header.bioTextLabel.numberOfLines = numDetailTextLines
        header.textLabel.font = UIFont.boldSystemFont(ofSize: nameTextFontSize)
        if let detailTextFont=UIFont(name: "Arial",size: detailTextFontSize){
            header.bioTextLabel.font = detailTextFont
        }
        header.bioTextLabel.heightAnchor.constraint(equalToConstant: CGFloat(12*numDetailTextLines)).isActive = true
        return header
    }
}

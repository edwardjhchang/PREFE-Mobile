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
    
    var cells = [MyPostCell]()
    var user = User()
    var posts = [Post]()
    let rowSize: CGFloat = 210
    var numDetailTextLines = 0
    let nameTextFontSize:CGFloat = 12.0
    let detailTextFontSize:CGFloat = 10.0
    var pictureHeight: CGFloat?
    let maxCharInLine = 57
    
    //var likeButton: UIButton?
    var listButton: UIButton?
    var gridButton: UIButton?
    var listLayoutInUse = true
    //var layoutControl: UISegmentedControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainController?.changeSelected(select: 4)
        pictureHeight = (mainController?.screenWidth)! - 40
        
        let layout = ListLayout()
        layout.itemSize = CGSize(width: pictureHeight!, height: pictureHeight!+20)
        
        colView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        colView.delegate   = self
        colView.dataSource = self
        colView.register(MyPostCell.self, forCellWithReuseIdentifier: cellId)
        colView.backgroundColor = UIColor.white
        colView.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        colView.allowsSelection = false
        
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
    }
    
    func setupViews() {
        self.view.addSubview(colView)
        
        /*
         layoutControl = UISegmentedControl()
         layoutControl?.translatesAutoresizingMaskIntoConstraints = false
         layoutControl?.backgroundColor = UIColor.white
         layoutControl?.insertSegment(with: UIImage(named: "findFriends"), at: 0, animated: false)
         layoutControl?.insertSegment(with: UIImage(named: "settings"), at:1, animated: false)
         
         layoutControl?.addTarget(self, action: #selector(handleChangeLayout), for: .valueChanged)*/
        
        listButton = UIButton()
        var image = UIImage(named: "listlayout")
        listButton?.backgroundColor = UIColor.white
        listButton?.setImage(image, for: .normal)
        listButton?.translatesAutoresizingMaskIntoConstraints = false
        listButton?.addTarget(self, action: #selector(handleChangeToList), for: .touchUpInside)
        
        gridButton = UIButton()
        image = UIImage(named: "gridlayout")
        gridButton?.backgroundColor = UIColor.white
        gridButton?.setImage(image, for: .normal)
        gridButton?.translatesAutoresizingMaskIntoConstraints = false
        gridButton?.addTarget(self, action: #selector(handleChangeToGrid), for: .touchUpInside)
        /*
        likeButton = UIButton()
        image = UIImage(named: "like")
        likeButton?.backgroundColor = UIColor.blue
        likeButton?.setImage(image, for: .normal)
        likeButton?.translatesAutoresizingMaskIntoConstraints = false
        //likeButton.addTarget(self, action: #selector(handleLikePicture), for: .touchUpInside)
 */
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
        self.posts.append(post)
        self.posts.append(post)
        self.posts.append(post)
        self.posts.append(post)
        self.posts.append(post)
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
        cell.textLabel.text = "Date"
        cell.postImageView.image = UIImage(named: "me")
        cell.pictureHeight = (mainController?.screenWidth)!
        //cell.likeButton = likeButton
        self.cells.append(cell)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: CGFloat(140+12*numDetailTextLines))
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

        header.listButton = listButton
        header.gridButton = gridButton
        //header.layoutControl = layoutControl
        return header
    }
    
    func handleChangeToList() {
        if (!listLayoutInUse) {
            let layout = ListLayout()
            layout.itemSize = CGSize(width: pictureHeight!, height: pictureHeight!+20)
        
            UIView.animate(withDuration: 0, animations: {() -> Void in
                self.colView.collectionViewLayout.invalidateLayout()
                self.colView.setCollectionViewLayout(layout, animated: false)
            })
            for i in cells {
                i.setupViews()
            }
            listLayoutInUse = true
        }
    }
    
    func handleChangeToGrid() {
        if listLayoutInUse {
            let layout = GridLayout()
            let gridCellHeight:CGFloat = ((mainController?.screenWidth)! - 60)/3
            layout.itemSize = CGSize(width: gridCellHeight, height: gridCellHeight)
        
            UIView.animate(withDuration: 0, animations: {() -> Void in
                self.colView.collectionViewLayout.invalidateLayout()
                self.colView.setCollectionViewLayout(layout, animated: false)
            })
            for i in cells {
                i.likeButton?.removeFromSuperview()
                i.textLabel.removeFromSuperview()
                i.listLayoutInUse = false
            }
            listLayoutInUse = false
        }
    }
}

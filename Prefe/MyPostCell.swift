//
//  MyPost.swift
//  Prefe
//
//  Created by Edward Joon-Hyuk Chang on 04/11/2016.
//  Copyright © 2016 Prefe. All rights reserved.
//

import UIKit

class MyPostCell: UICollectionViewCell{
    var pictureHeight:CGFloat?
    var listLayoutInUse: Bool = false
    var firstTime: Bool = true
    
    var likeButton: UIButton? = {
        let likeButton = UIButton()
        let image = UIImage(named: "like")
        likeButton.backgroundColor = UIColor.white
        likeButton.setImage(image, for: .normal)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        return likeButton
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.font = UIFont(name: "Arial", size: 13)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "default")
        imageView.translatesAutoresizingMaskIntoConstraints=false
        imageView.layer.masksToBounds=true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    func setupViews(){
        backgroundColor = UIColor.white
        addSubview(postImageView)
        addSubview(likeButton!)
        addSubview(textLabel)
        
        postImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive=true
        postImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive=true
        postImageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive=true
        postImageView.heightAnchor.constraint(equalTo: self.widthAnchor).isActive=true
        
        likeButton?.rightAnchor.constraint(equalTo: postImageView.rightAnchor).isActive=true
        likeButton?.topAnchor.constraint(equalTo: postImageView.bottomAnchor).isActive=true
        likeButton?.widthAnchor.constraint(equalToConstant: 20).isActive=true
        likeButton?.heightAnchor.constraint(equalToConstant: 20).isActive=true
        
        textLabel.rightAnchor.constraint(equalTo: postImageView.rightAnchor).isActive=true
        textLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor).isActive=true
        textLabel.widthAnchor.constraint(equalToConstant: 60).isActive=true
        textLabel.heightAnchor.constraint(equalToConstant: 20).isActive=true
        listLayoutInUse = true
        firstTime = false
        /*
        if (firstTime) {
            backgroundColor = UIColor.white
            addSubview(postImageView)
            addSubview(textLabel)
            
            postImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive=true
            postImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive=true
            postImageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive=true
            postImageView.heightAnchor.constraint(equalTo: self.widthAnchor).isActive=true
            
            textLabel.rightAnchor.constraint(equalTo: postImageView.rightAnchor).isActive=true
            textLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor).isActive=true
            textLabel.widthAnchor.constraint(equalToConstant: 60).isActive=true
            textLabel.heightAnchor.constraint(equalToConstant: 20).isActive=true
            listLayoutInUse = true
            firstTime = false
        }
        else if !listLayoutInUse {
            addSubview(textLabel)
            addSubview(likeButton!)
            
            postImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive=true
            postImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive=true
            postImageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive=true
            postImageView.heightAnchor.constraint(equalTo: self.widthAnchor).isActive=true
            
            likeButton?.rightAnchor.constraint(equalTo: postImageView.rightAnchor).isActive=true
            likeButton?.topAnchor.constraint(equalTo: postImageView.bottomAnchor).isActive=true
            likeButton?.widthAnchor.constraint(equalToConstant: 20).isActive=true
            likeButton?.heightAnchor.constraint(equalToConstant: 20).isActive=true
            
            textLabel.rightAnchor.constraint(equalTo: postImageView.rightAnchor).isActive=true
            textLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor).isActive=true
            textLabel.widthAnchor.constraint(equalToConstant: 60).isActive=true
            textLabel.heightAnchor.constraint(equalToConstant: 20).isActive=true
            listLayoutInUse = true
        }*/
    }
    
    func handleLikePicture() {
        
    }
}

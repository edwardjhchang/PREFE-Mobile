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
    var leftIndent:CGFloat = 0.0
    
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
    
    let detailTextLabel: UILabel = {
        let detailTextLabel = UILabel()
        detailTextLabel.font = UIFont(name: "Arial", size: 11)
        detailTextLabel.translatesAutoresizingMaskIntoConstraints = false
        return detailTextLabel
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
        backgroundColor = UIColor.clear
        addSubview(textLabel)
        addSubview(detailTextLabel)
        addSubview(postImageView)
        
        postImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: leftIndent).isActive=true
        postImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: leftIndent).isActive=true
        postImageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive=true
        postImageView.heightAnchor.constraint(equalTo: self.widthAnchor).isActive=true
        
        textLabel.leftAnchor.constraint(equalTo: postImageView.leftAnchor).isActive=true
        textLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor).isActive=true
        textLabel.widthAnchor.constraint(equalToConstant: pictureHeight!).isActive=true
        textLabel.heightAnchor.constraint(equalToConstant: 25).isActive=true
        
        detailTextLabel.leftAnchor.constraint(equalTo: textLabel.leftAnchor).isActive=true
        detailTextLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: -8).isActive=true
        detailTextLabel.widthAnchor.constraint(equalToConstant: pictureHeight!).isActive=true
        detailTextLabel.heightAnchor.constraint(equalToConstant: 24).isActive=true
    }
}

//
//  ProfileCell.swift
//  Prefe
//
//  Created by Edward Joon-Hyuk Chang on 03/11/2016.
//  Copyright © 2016 Prefe. All rights reserved.
//

import UIKit

class ProfileCell: UICollectionViewCell{
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = ""
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    let detailTextLabel: UILabel = {
        let detailTextLabel = UILabel()
        detailTextLabel.text = ""
        detailTextLabel.translatesAutoresizingMaskIntoConstraints = false
        return detailTextLabel
    }()
    
    let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.translatesAutoresizingMaskIntoConstraints=false
        imageView.layer.cornerRadius = 37
        imageView.layer.masksToBounds=true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let headerLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var pictureHeight:CGFloat = 74
    
    func setupViews(){
        backgroundColor = UIColor.white
        addSubview(textLabel)
        addSubview(detailTextLabel)
        addSubview(postImageView)
        addSubview(headerLine)
        
        textLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive=true
        textLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive=true
        textLabel.widthAnchor.constraint(equalToConstant: pictureHeight).isActive=true
        textLabel.heightAnchor.constraint(equalToConstant: pictureHeight).isActive=true
        
        detailTextLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive=true
        detailTextLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive=true
        detailTextLabel.widthAnchor.constraint(equalToConstant: pictureHeight).isActive=true
        detailTextLabel.heightAnchor.constraint(equalToConstant: pictureHeight).isActive=true
        
        postImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive=true
        postImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive=true
        postImageView.widthAnchor.constraint(equalToConstant: pictureHeight).isActive=true
        postImageView.heightAnchor.constraint(equalToConstant: pictureHeight).isActive=true
        
        headerLine.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        headerLine.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -28).isActive = true
        headerLine.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32).isActive = true
        headerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

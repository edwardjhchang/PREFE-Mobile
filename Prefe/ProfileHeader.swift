//
//  ProfileHeader.swift
//  Prefe
//
//  Created by Edward Joon-Hyuk Chang on 05/11/2016.
//  Copyright © 2016 Prefe. All rights reserved.
//

import UIKit

class ProfileHeader: UICollectionViewCell {
    let pictureHeight: CGFloat = 74
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handleLayoutChange() {
        
    }
    
    let textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Text"
        textLabel.font = UIFont(name: "Arial", size: 13)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    let bioTextLabel: UILabel = {
        let bioTextLabel = UILabel()
        bioTextLabel.text = "Caption"
        bioTextLabel.font = UIFont(name: "Arial", size: 11)
        bioTextLabel.numberOfLines = 2
        bioTextLabel.translatesAutoresizingMaskIntoConstraints = false
        return bioTextLabel
    }()
    
    var profileImageView: UIImageView = {
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
    
    let gridButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        button.setTitle("Yeah", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let listButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        button.setTitle("Yeah", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupViews(){
        backgroundColor = UIColor.clear
        addSubview(textLabel)
        addSubview(bioTextLabel)
        addSubview(profileImageView)
        addSubview(headerLine)
        addSubview(gridButton)
        addSubview(listButton)
        
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive=true
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive=true
        profileImageView.widthAnchor.constraint(equalToConstant: pictureHeight).isActive=true
        profileImageView.heightAnchor.constraint(equalToConstant: pictureHeight).isActive=true
        
        textLabel.leftAnchor.constraint(equalTo: profileImageView.leftAnchor).isActive=true
        textLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor).isActive=true
        textLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -40).isActive=true
        textLabel.heightAnchor.constraint(equalToConstant: 14.5).isActive=true
        
        bioTextLabel.leftAnchor.constraint(equalTo: textLabel.leftAnchor).isActive=true
        bioTextLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor).isActive=true
        bioTextLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -40).isActive=true
        
        headerLine.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        headerLine.topAnchor.constraint(equalTo: bioTextLabel.bottomAnchor, constant: 3).isActive = true
        headerLine.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32).isActive = true
        headerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        gridButton.leftAnchor.constraint(equalTo: profileImageView.leftAnchor).isActive = true
        gridButton.topAnchor.constraint(equalTo: headerLine.bottomAnchor, constant: 5).isActive = true
        gridButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        gridButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        listButton.leftAnchor.constraint(equalTo: gridButton.rightAnchor, constant: 10).isActive = true
        listButton.topAnchor.constraint(equalTo: headerLine.bottomAnchor, constant: 5).isActive = true
        listButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        listButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

}

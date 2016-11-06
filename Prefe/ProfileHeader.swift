//
//  ProfileHeader.swift
//  Prefe
//
//  Created by Edward Joon-Hyuk Chang on 05/11/2016.
//  Copyright © 2016 Prefe. All rights reserved.
//

import UIKit

class ProfileHeader: UICollectionViewCell {
    let headerHeight: CGFloat = 74.0
    
    //var layoutControl: UISegmentedControl?
    var gridButton: UIButton?
    var listButton: UIButton?
    
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
    
    func setupViews(){
        backgroundColor = UIColor.clear
        addSubview(textLabel)
        addSubview(bioTextLabel)
        addSubview(profileImageView)
        addSubview(headerLine)
        
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive=true
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive=true
        profileImageView.widthAnchor.constraint(equalToConstant: headerHeight).isActive=true
        profileImageView.heightAnchor.constraint(equalToConstant: headerHeight).isActive=true
        
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
    }
    override func layoutSubviews() {
        
        addSubview((gridButton)!)
        addSubview((listButton)!)
        
        listButton?.leftAnchor.constraint(equalTo: profileImageView.leftAnchor).isActive = true
        listButton?.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        listButton?.widthAnchor.constraint(equalToConstant: 20).isActive = true
        listButton?.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        gridButton?.leftAnchor.constraint(equalTo: (listButton?.rightAnchor)!, constant: 10).isActive = true
        gridButton?.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        gridButton?.widthAnchor.constraint(equalToConstant: 20).isActive = true
        gridButton?.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        /*
        addSubview((layoutControl)!)
        layoutControl?.leftAnchor.constraint(equalTo: profileImageView.leftAnchor).isActive = true
        layoutControl?.topAnchor.constraint(equalTo: headerLine.bottomAnchor, constant: 5).isActive = true
        layoutControl?.widthAnchor.constraint(equalToConstant: 45).isActive = true
        layoutControl?.heightAnchor.constraint(equalToConstant: 20).isActive = true*/
    }
}

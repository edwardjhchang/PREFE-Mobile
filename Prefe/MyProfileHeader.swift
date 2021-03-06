//
//  MyProfileHeader.swift
//  Prefe
//
//  Created by Edward Joon-Hyuk Chang on 03/11/2016.
//  Copyright © 2016 Prefe. All rights reserved.
//

import UIKit

class MyProfileHeader: UITableViewCell {
/*    var user: User? {
        didSet{
            self.textLabel?.text = user?.name
            self.detailTextLabel?.text = user?.bio
            if (user?.profilePictureUrl) != nil {
                self.postImageView.image = UIImage(named: "me")
            }
        }
    }*/
    
    override func layoutSubviews(){
        super.layoutSubviews()
        textLabel?.frame = CGRect(x: textLabel!.frame.origin.x, y: pictureHeight+30, width: textLabel!.frame.width, height: textLabel!.frame.height)
        detailTextLabel?.frame = CGRect(x: textLabel!.frame.origin.x, y: pictureHeight+50, width: detailTextLabel!.frame.width, height: detailTextLabel!.frame.height)
    }
    
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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        addSubview(postImageView)
        addSubview(headerLine)
        
        // ios 9 constraint anchors
        // need x, y, width, height anchors
        postImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive=true
        postImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive=true
        postImageView.widthAnchor.constraint(equalToConstant: pictureHeight).isActive=true
        postImageView.heightAnchor.constraint(equalToConstant: pictureHeight).isActive=true
        
        headerLine.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        headerLine.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -28).isActive = true
        headerLine.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32).isActive = true
        headerLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    required init(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}

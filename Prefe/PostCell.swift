//
//  PostCell.swift
//  Prefe
//
//  Created by Edward Joon-Hyuk Chang on 03/11/2016.
//  Copyright © 2016 Prefe. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    var pictureHeight:CGFloat?
    
    override func layoutSubviews(){
        super.layoutSubviews()
        //textLabel?.frame = CGRect(x: textLabel!.frame.origin.x, y: pictureHeight!+10, width: textLabel!.frame.width, height: textLabel!.frame.height)
        //detailTextLabel?.frame = CGRect(x: textLabel!.frame.origin.x, y: pictureHeight!+30, width: detailTextLabel!.frame.width, height: detailTextLabel!.frame.height)
    }
    
    var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "default")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        addSubview(postImageView)

        postImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive=true
        postImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive=true
        postImageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        postImageView.heightAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    required init(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}

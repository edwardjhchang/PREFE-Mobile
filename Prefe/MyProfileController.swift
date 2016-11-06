//
//  MyProfileController.swift
//  Prefe
//
//  Created by Edward Joon-Hyuk Chang on 03/11/2016.
//  Copyright © 2016 Prefe. All rights reserved.
//

import UIKit

class MyProfileController: UITableViewController {
    
    var mainController: TabBarController?
    let headerId = "headerId"
    let cellId = "cellId"
    var user = User()
    var posts = [Post]()
    let rowSize: CGFloat = 210
    let numDetailTextLines = 4
    let nameTextFontSize:CGFloat = 12.0
    let detailTextFontSize:CGFloat = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainController?.changeSelected(select: 4)
        
        self.tableView = UITableView(frame: self.tableView.frame, style: .grouped)
        tableView.register(MyProfileHeader.self, forCellReuseIdentifier: headerId)
        tableView.register(PostCell.self, forCellReuseIdentifier: cellId)
        fetchUser()
        fetchPosts()
        setupNavBar()
        
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
        
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
        })
    }
    
    func fetchPosts(){
        // Code for now
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
        
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
        })
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: headerId) as! MyProfileHeader
        header.backgroundColor = UIColor.white
        header.textLabel?.text = user.name
        if(user.bio != nil) {
            if(user.organization != nil) {
                header.detailTextLabel?.text = user.bio!+"\n"+user.organization!
            }
            else {
                header.detailTextLabel?.text = user.bio
            }
        }
        header.detailTextLabel?.numberOfLines = numDetailTextLines
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: nameTextFontSize)
        if let detailTextFont=UIFont(name: "Arial",size: detailTextFontSize){
            header.detailTextLabel?.font = detailTextFont
        }
        return header
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PostCell
        let post = posts[indexPath.row]
        cell.textLabel?.text = post.posterID
        cell.detailTextLabel?.text = post.caption
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150+CGFloat(numDetailTextLines-1)*detailTextFontSize + nameTextFontSize
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowSize
    }
}

//
//  ViewController.swift
//  Prefe
//
//  Created by Edward Joon-Hyuk Chang on 03/11/2016.
//  Copyright © 2016 Prefe. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {

    var mainController: TabBarController?
    let cellId = "cellId"
    var posts = [Post]()
    var pictureHeight: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainController?.changeSelected(select: 0)
        
        tableView.register(PostCell.self, forCellReuseIdentifier: cellId)
        fetchPosts()
    }
    
    //Check if user is logged in. If not, move to the login page automatically
    func checkIfUserIsLoggedIn() {/*
        if FIRAuth.auth()?.currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            
            let uid = FIRAuth.auth()?.currentUser?.uid
            FIRDatabase.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: {(snapshot) in
                if let dictionary = snapshot.value as? [String: AnyObject] {
                    self.navigationItem.title = dictionary["name"] as? String
                }
            }, withCancel: nil)
            
        }*/
    }
    
    func handleLogout(){/*
        do {
            try FIRAuth.auth()?.signOut()
        } catch let logoutError {
            let alertController=UIAlertController(title:"Error",message:"Error in Logging Out",preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title:"OK",style:UIAlertActionStyle.cancel,handler: nil))
            self.present(alertController,animated:true,completion: nil)
            return
        }
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)*/
    }
    
    func handleNewMessage() {
        let newMessageController = MessageController()
        let navController = UINavigationController(rootViewController: newMessageController)
        present(navController, animated: true, completion: nil)
    }

    //Fill home tab with posts
    func fetchPosts() {
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PostCell
        let post = posts[indexPath.row]
        cell.textLabel?.text = post.posterID
        cell.detailTextLabel?.text = post.caption
        cell.postImageView.image = UIImage(named: "long")
        cell.pictureHeight = (mainController?.screenWidth)!
        /*
        let imageSize = cell.postImageView.image?.size
        if imageSize != nil {
            if imageSize!.width > imageSize!.height {
                cell.pictureHeight = (mainController?.screenWidth)!*(imageSize!.height)/(imageSize!.width)
                cell.postImageView.heightAnchor.constraint(equalToConstant: (cell.pictureHeight)!)
            }
            else {
                cell.pictureHeight = (mainController?.screenWidth)!
            }
        }*/
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}

//
//  TabBarController.swift
//  Prefe
//
//  Created by Edward Joon-Hyuk Chang on 03/11/2016.
//  Copyright © 2016 Prefe. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    //selected is a value that keeps track of the last tab the user was viewing before moving on to new post screen.
    var selected: Int?
    let screenSize:CGRect = UIScreen.main.bounds
    var screenWidth:CGFloat?
    var screenHeight:CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setNavTitleFont()
        
        delegate = self
        
        //set values for screen width and screen size
        screenWidth = screenSize.width
        screenHeight = screenSize.height
    }
    
    func setNavBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(handleLogout))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Message", style: .plain, target: self, action: #selector(handleMessage))
        navigationItem.title="P R E F E"
    }
    
    func handleLogout(){
        /*do {
            try FIRAuth.auth()?.signOut()
        } catch let logoutError {
            let alertController=UIAlertController(title:"Error",message:"Error in Logging Out",preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title:"OK",style:UIAlertActionStyle.cancel,handler: nil))
            self.present(alertController,animated:true,completion: nil)
            return
        }*/
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
    
    //called by tabs to update value of selected
    func changeSelected(select: Int){
        selected = select
    }
    
    func handleMessage() {
        let newMessageController = MessageController()
        let navController = UINavigationController(rootViewController: newMessageController)
        present(navController, animated: true, completion: nil)
    }
    
    func setNavTitleFont(){
        if let navBarFont=UIFont(name: "Arial",size: 15.0){
            UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: navBarFont]
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let item1 = HomeController()
        item1.mainController = self
        let image1 = UIImage(named: "home")
        let icon1 = UITabBarItem(title: "Home", image: image1, selectedImage: image1)
        item1.tabBarItem = icon1
        
        let item2 = SearchController()
        item2.mainController = self
        let image2 = UIImage(named: "search")
        let icon2 = UITabBarItem(title: "Search", image: image2, selectedImage: image2)
        item2.tabBarItem = icon2
        
        let item3 = HookController()
        item3.mainController = self
        let image3 = UIImage(named: "hook")
        let icon3 = UITabBarItem(title: "Hook", image: image3, selectedImage: image3)
        item3.tabBarItem = icon3
        
        let item4 = NotificationController()
        item4.mainController = self
        let image4 = UIImage(named: "notifications")
        let icon4 = UITabBarItem(title: "Notifications", image: image4, selectedImage: image4)
        item4.tabBarItem = icon4
        let item5 = ProfileController()
        
        item5.mainController = self
        let image5 = UIImage(named: "roundedMe")
        let imageView = UIImageView(frame: CGRect(x:0,y:0,width: 20, height: 20))
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, UIScreen.main.scale)
        UIBezierPath(roundedRect: imageView.bounds, cornerRadius:10.0).addClip()
        image5?.draw(in: imageView.bounds)
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let icon5 = UITabBarItem(title: "My Page", image: imageView.image, selectedImage: imageView.image)
        item5.tabBarItem = icon5
        
        let controllers = [item1, item2, item3, item4, item5]
        self.viewControllers = controllers
        for i in 0...4 {
            tabBar.items?[i].tag = i
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 4 {
            var friendsImage=UIImage(named: "findFriends.png")
            friendsImage = friendsImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: friendsImage, style: .plain, target: self, action: #selector(handleFindFriends))
            var settingsImage=UIImage(named: "settings.png")
            settingsImage = settingsImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: settingsImage, style: .plain, target: self, action: #selector(handleSettings))
        }
        else {
            setNavBar()
        }
    }
    
    func handleFindFriends(){
        
    }
    
    func handleSettings(){
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true;
    }
    
}

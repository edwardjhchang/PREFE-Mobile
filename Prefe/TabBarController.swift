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
        
        delegate = self
        
        //set values for screen width and screen size
        screenWidth = screenSize.width
        screenHeight = screenSize.height
    }
    
    func setNavBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(handleLogout))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Message", style: .plain, target: self, action: #selector(handleMessage))
        navigationItem.title="P R E F E"
        setNavBarFont()
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
    
    func setNavBarFont(){
        if let navBarFont=UIFont(name: "Arial",size: 15.0){
            UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: navBarFont]
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let item1 = HomeController()
        item1.mainController = self
        let image1 = UIImage(named: "Optimized-profile")
        let icon1 = UITabBarItem(title: "Home", image: image1, selectedImage: image1)
        item1.tabBarItem = icon1
        
        let item2 = SearchController()
        item2.mainController = self
        let image2 = UIImage(named: "Optimized-profile")
        let icon2 = UITabBarItem(title: "Feed", image: image2, selectedImage: image2)
        item2.tabBarItem = icon2
        
        let item3 = HookController()
        item3.mainController = self
        let image3 = UIImage(named: "Optimized-profile")
        let icon3 = UITabBarItem(title: "Activities", image: image3, selectedImage: image3)
        item3.tabBarItem = icon3
        
        let item4 = NotificationController()
        item4.mainController = self
        let image4 = UIImage(named: "Optimized-profile")
        let icon4 = UITabBarItem(title: "Activities", image: image4, selectedImage: image4)
        item4.tabBarItem = icon4
        let item5 = ProfileController()
        
        item5.mainController = self
        let image5 = UIImage(named: "Optimized-profile")
        let icon5 = UITabBarItem(title: "Profile", image: image5, selectedImage: image5)
        item5.tabBarItem = icon5
        
        let controllers = [item1, item2, item3, item4, item5]
        self.viewControllers = controllers
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true;
    }
    
}

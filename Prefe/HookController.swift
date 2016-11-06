//
//  HookController.swift
//  Prefe
//
//  Created by Edward Joon-Hyuk Chang on 03/11/2016.
//  Copyright © 2016 Prefe. All rights reserved.
//

import UIKit

class HookController: UITableViewController {
    
    var mainController: TabBarController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newPostController = NewPostController()
        newPostController.postController = self
        let navController = UINavigationController(rootViewController: newPostController)
        present(navController, animated: true, completion: nil)
    }
    func handleCancel() {
        mainController?.selectedIndex = ((mainController?.selected))!
        dismiss(animated: true, completion: nil)
    }
}

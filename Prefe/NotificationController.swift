//
//  NotificationController.swift
//  Prefe
//
//  Created by Edward Joon-Hyuk Chang on 03/11/2016.
//  Copyright © 2016 Prefe. All rights reserved.
//

import UIKit

class NotificationController: UITableViewController {
    
    var mainController: TabBarController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainController?.changeSelected(select: 3)
        
        setupActivities()
    }
    
    lazy var activities: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Following", "You"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.selectedSegmentIndex = 1
        sc.addTarget(self, action: #selector(handleActivitiesChange), for: .valueChanged)
        return sc
    }()
    
    func setupActivities(){
        view.addSubview(activities)
        activities.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activities.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        activities.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        activities.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    func handleActivitiesChange(){
        
    }
}

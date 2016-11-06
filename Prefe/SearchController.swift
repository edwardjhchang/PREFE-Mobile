//
//  SearchController.swift
//  Prefe
//
//  Created by Edward Joon-Hyuk Chang on 03/11/2016.
//  Copyright © 2016 Prefe. All rights reserved.
//

import UIKit

class SearchController: UITableViewController {
    
    var mainController: TabBarController?
    
    let inputTextField: UITextField={
        let textField=UITextField()
        textField.placeholder = "Search"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainController?.changeSelected(select: 1)
        
        view.addSubview(inputTextField)
        setupInputTextField()
        
    }
    func setupInputTextField() {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive=true
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive=true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive=true
        containerView.heightAnchor.constraint(equalToConstant: 50).isActive=true
        
        containerView.addSubview(inputTextField)
        inputTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 12).isActive=true
        inputTextField.topAnchor.constraint(equalTo: containerView.topAnchor).isActive=true
        inputTextField.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive=true
        inputTextField.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive=true
        
        let separatorLineView = UIView()
        separatorLineView.backgroundColor = UIColor(r:220,g:220,b:220)
        separatorLineView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(separatorLineView)
        
        separatorLineView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive=true
        separatorLineView.topAnchor.constraint(equalTo: containerView.bottomAnchor).isActive=true
        separatorLineView.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive=true
        separatorLineView.heightAnchor.constraint(equalToConstant: 1).isActive=true
    }}

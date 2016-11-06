//
//  NewPostController.swift
//  Prefe
//
//  Created by Edward Joon-Hyuk Chang on 03/11/2016.
//  Copyright © 2016 Prefe. All rights reserved.
//

import UIKit

class NewPostController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(handlePost))
        navigationItem.title="New Post"
        view.backgroundColor=UIColor.white
        view.addSubview(postImageView)
        setupPostImageView()
        setupInputComponents()
    }
    
    var postController: HookController?
    
    let inputTextField: UITextField={
        let textField=UITextField()
        textField.placeholder = "Write a description"
        textField.translatesAutoresizingMaskIntoConstraints=false
        return textField
    }()
    
    lazy var postImageView: UIImageView={
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(handleSelectImage)))
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    func handleSelectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func handleCancel() {
        dismiss(animated: true, completion: nil)
        postController?.handleCancel()
    }
    
    func handlePost() {
        /*
         let ref = FIRDatabase.database().reference().child("posts")
         let childRef = ref.childByAutoId()
         let posterID=FIRAuth.auth()!.currentUser!.uid
         let imageName = UUID().uuidString
         let timestamp: NSNumber = NSNumber(integerLiteral: Int(Date().timeIntervalSince1970))
         let storageRef=FIRStorage.storage().reference().child("post_images").child("\(imageName).png")
         if let uploadData = UIImagePNGRepresentation(self.postImageView.image!) {
         storageRef.put(uploadData, metadata: nil, completion: { (metadata, error) in
         if error != nil {
         print(error)
         return
         }
         if let postImageUrl = metadata?.downloadURL()?.absoluteString {
         let values=["caption":self.inputTextField.text!,"timestamp":timestamp,"url": postImageUrl,"posterID":posterID] as [String : Any]
         childRef.updateChildValues(values)
         }
         })
         }*/
        dismiss(animated: true, completion: nil)
        postController?.mainController?.selected = 0
        postController?.mainController?.selectedIndex = ((postController?.mainController?.selected))!
        postController?.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImageFromPicker = originalImage
        }
        if let selectedImage = selectedImageFromPicker {
            postImageView.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker:UIImagePickerController){
        dismiss(animated: true,completion: nil)
    }
    
    func setupPostImageView() {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let sideLength:CGFloat
        if screenWidth < screenHeight {
            sideLength = screenWidth
        } else {
            sideLength = screenHeight
        }
        postImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive=true
        postImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 63).isActive=true
        postImageView.widthAnchor.constraint(equalToConstant: sideLength).isActive=true
        postImageView.heightAnchor.constraint(equalToConstant: sideLength).isActive=true
    }
    
    func setupInputComponents() {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive=true
        containerView.topAnchor.constraint(equalTo: postImageView.bottomAnchor).isActive=true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive=true
        containerView.heightAnchor.constraint(equalToConstant: 100).isActive=true
        
        let separatorLineView = UIView()
        separatorLineView.backgroundColor = UIColor(r:220,g:220,b:220)
        separatorLineView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(separatorLineView)
        separatorLineView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive=true
        separatorLineView.topAnchor.constraint(equalTo: postImageView.bottomAnchor).isActive=true
        separatorLineView.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive=true
        separatorLineView.heightAnchor.constraint(equalToConstant: 1).isActive=true
        
        containerView.addSubview(inputTextField)
        inputTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive=true
        inputTextField.topAnchor.constraint(equalTo: postImageView.bottomAnchor).isActive=true
        inputTextField.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive=true
        inputTextField.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive=true
    }
}

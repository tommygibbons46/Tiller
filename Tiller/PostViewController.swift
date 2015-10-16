//
//  PostViewController.swift
//  Tiller
//
//  Created by Thomas Gibbons on 10/5/15.
//  Copyright © 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

protocol postDelegate
{
    func userPosts(message: String)
}

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate {
    
    var delegate: postDelegate? = nil
    
    let toolbar : UIToolbar = UIToolbar()
    
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        toolbar.barStyle = UIBarStyle.Default
        let cameraBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Camera, target: self, action: "myCameraAction")

        toolbar.items=[
            cameraBarButtonItem
        ]
        toolbar.sizeToFit()
        textView.inputAccessoryView = toolbar
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func myCameraAction()
    {
        let alert = UIAlertController(title: nil, message: "Camera", preferredStyle: UIAlertControllerStyle.ActionSheet)
        alert.addAction(UIAlertAction(title: "Take Photo", style: .Default, handler: { (action1) -> Void in
            self.showTakePhotoView()
        }))
        alert.addAction(UIAlertAction(title: "Choose From Library", style: .Default, handler: { (action2) -> Void in
            self.showChooseFromLibrary()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action3) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    
    func showTakePhotoView()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .Camera
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    func showChooseFromLibrary()
    {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary)
        {
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(imagePicker: UIImagePickerController)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        dismissViewControllerAnimated(true, completion: nil)
        
//        let image = info[UIImagePickerControllerEditedImage] as! UIImage
//        self.profilePic.contentMode = UIViewContentMode.ScaleAspectFit
//        self.profilePic.image = image
//        let imageData = UIImageJPEGRepresentation(image, 0.25)
//        self.theCurrentUser?.profilePic = PFFile(name: "image", data: imageData)
//        self.theCurrentUser?.hasPhoto = 1
//        self.theCurrentUser!.saveInBackgroundWithBlock
//            {
//                (success, error) -> Void in
//                if (success)
//                {
//                    //println("saved img file to user")
//                }
//                else
//                {
//                    //println("no saved")
//                }
//        }
    }
    
//    func myCameraAction()
//    {
//
//        let alertController = UIAlertController(title: "Upload photo", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
//        let takePhoto = UIAlertAction(title: "cam", style: .Default) { (action1) -> Void in
//            self.
//        }
//        let cameraRoll = UIAlertAction(title: "Camera Roll", style: UIAlertActionStyle.Default, handler: nil)
//        let takePhoto = UIAlertAction(title: "Take Photo", style: UIAlertActionStyle.Default, handler: "takePhoto")
//        let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
//        alertController.addAction(cameraRoll)
//        alertController.addAction(takePhoto)
//        alertController.addAction(cancelButton)
//        
//        presentViewController(alertController, animated: true, completion: nil)
//
//    }
//    
    
    @IBAction func DoneButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

    @IBAction func PostButton(sender: AnyObject) {
        var text = textView.text
        delegate?.userPosts(text)
        print("hit this")
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
}

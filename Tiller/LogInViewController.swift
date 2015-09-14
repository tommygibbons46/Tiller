//
//  LogInViewController.swift
//  Tiller
//
//  Created by Thomas Gibbons on 8/19/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.hidden = true
        passwordTextField.hidden = true
        
    }

    
    
    @IBAction func logInButtonTap(sender: AnyObject) {
        
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.logInButton.frame = CGRectMake(self.logInButton.frame.minX, self.view.frame.maxY, self.logInButton.frame.width, self.logInButton.frame.height)
            self.signUpButton.frame =
            CGRectMake(self.logInButton.frame.minX, self.view.frame.maxY, self.logInButton.frame.width, self.logInButton.frame.height)
        }) { (success) -> Void in
            self.emailTextField.hidden = false
            self.passwordTextField.hidden = false
            self.logInButton.hidden = true
            self.signUpButton.hidden = true
        }
    }


    @IBAction func signUpButtonTap(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.logInButton.frame = CGRectMake(self.logInButton.frame.minX, self.view.frame.maxY, self.logInButton.frame.width, self.logInButton.frame.height)
            self.signUpButton.frame =
                CGRectMake(self.logInButton.frame.minX, self.view.frame.maxY, self.logInButton.frame.width, self.logInButton.frame.height)
            }) { (success) -> Void in
                
                self.logInButton.frame = CGRectMake(self.logInButton.frame.minX, self.view.frame.maxY, self.logInButton.frame.width, self.logInButton.frame.height)
                self.signUpButton.frame =
                    CGRectMake(self.logInButton.frame.minX, self.view.frame.maxY, self.logInButton.frame.width, self.logInButton.frame.height)
        }
    }
}

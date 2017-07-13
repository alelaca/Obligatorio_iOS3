//
//  LoginViewController.swift
//  iOS_Obligatorio3
//
//  Created by SP07 on 6/7/17.
//  Copyright © 2017 Apple, Inc. All rights reserved.
//

import Foundation
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userTextView: UITextField!
    @IBOutlet weak var passTextView: UITextField!
    
    @IBAction func loginAction(_ sender: Any) {
        if verifyLoginData() {
            FIRAuth.auth()?.signIn(withEmail: userTextView.text!, password: passTextView.text!) { (user, error) in
                if let error = error {
                    let alertController = UIAlertController(title: "Message error", message: "User or password incorrect", preferredStyle: UIAlertControllerStyle.alert)
                    alertController.present(self, animated: true, completion: nil)
                }
                else if let user = user {
					UserManager.instance.userID = FIRAuth.auth()?.currentUser?.uid
                    self.performSegue(withIdentifier: "loginAction", sender: nil)
                }
            }
        }
    }
    
    func verifyLoginData() -> Bool{
        if userTextView.text == "" || passTextView.text == "" {
            return false
        }
        return true
    }
}

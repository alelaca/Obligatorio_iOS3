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
                    // mostrar un mensaje de error
                }
                else if let user = user {
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

//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2020 Dmitry All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
                print(e.localizedDescription)
            } else {
                //Navigate to ChatViewController
                self.performSegue(withIdentifier: K.registerSegue, sender: self)
            }
            }
        }
    }
    
}

//
//  ViewController.swift
//  Firechat
//
//  Created by Johann Kerr on 3/21/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        GIDSignIn.sharedInstance().uiDelegate = self
        
    }
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text else {return}
        FirebaseManager.login(email: email, password: password) { (user, successful) in
        }
    }
   
    @IBAction func registerBtnTapped(_ sender: Any) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text else {print("Invaild email or password"); return}
        FirebaseManager.signUp(email: email, password: password) { (user, successful) in
        }
    }
   
    @IBAction func signOutBtnTapped(_ sender: Any) {
        FirebaseManager.logOut { (true) in
            
        }
    }
    
   
}

//
//  FirebaseManager.swift
//  Firechat
//
//  Created by Johann Kerr on 3/23/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import Firebase

class FirebaseManager {
    
    class func signUp(email: String, password: String, completion: @escaping (FIRUser?, Bool) -> ()) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            guard let userUW = user else {return}
            if error == nil {
                completion(userUW, true)
            } else {
                completion(userUW, false)
            }
            
        })
    }
    
    class func login(email: String, password:String, completion: @escaping (FIRUser?, Bool) -> ()) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            guard let userUW = user else {return}
            
            if error == nil {
                completion(userUW, true)
            } else {
                completion(userUW, false)
            }
        })
    }
    
    class func logOut(completion: @escaping (Bool) -> ()) {
        do {
            try FIRAuth.auth()?.signOut()
            completion(true)
        } catch let signOutError as NSError {
            completion(false)
            print ("Error signing out: %@", signOutError)
        }
    }
    
}


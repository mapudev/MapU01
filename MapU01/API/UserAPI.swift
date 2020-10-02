//
//  UserAPI.swift
//  MapU01
//
//  Created by ting pan on 2020/9/27.
//  Copyright © 2020 MapU. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth


class UserAPI {

//    let currentUser = Auth.auth().currentUser
    
    var userRefRoot = Database.database().reference()

    var userRef = Database.database().reference().child("userList")
    
    func observeUser(withID uid: String, completion: @escaping (User) -> Void ) {
        
        userRef.child(uid).observeSingleEvent(of: .value, with: {
            (snapshot) in
            
            if let dic = snapshot.value as? [String: Any] {
                
                let user = User.certainUser(uid: uid, displayName: dic["name"] as! String)
                completion(user)
            }
                       
        })
    }
    
    
}

//
//  followingListAPI.swift
//  MapU01
//
//  Created by ting pan on 2020/9/16.
//  Copyright © 2020 MapU. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseAuth


class FollowingListAPI {

    let userRef = Database.database().reference()
      
    func fetchFollowingList(completion: @escaping (User) -> Void) {
         
        
       if let currentUserUID = Auth.auth().currentUser?.uid {
              
            let followingListRef = Database.database().reference().child("userList").child(currentUserUID).child("followingList")
                
        followingListRef.observe(.childAdded, with: {(Snapshot) in
                      
                    let followingUID = Snapshot.key
                    self.userRef.child("userList").child(followingUID).child("name").observe(DataEventType.value, with: { (snapshot) in
                    let userName = snapshot.value as? String
                        
                    let followingUser = User.followingList(uid: followingUID, displayName: userName ?? "")
                        completion(followingUser)
                    }
            )})
         
        }
               
    }

}

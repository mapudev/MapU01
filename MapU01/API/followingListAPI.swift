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

    func fetchFollowingList() {
        
        if let currentUser = Auth.auth().currentUser {
            
            var followingListRef = Database.database().reference().child("userList").child(currentUser.uid).child("followingList")
            
            func observeFollowingList(completion: @escaping (User) -> Void){
                
                followingListRef.observe(.childAdded, with: {(Snapshot) in
                    
                    let followingUid = Snapshot.key
                    // 拿followingUid去找出用戶顯示名稱，存到變數後再將變數存到displayname
                   let followingUserName = Database.database().reference().child("userList").child(followingUid).value(forKey: "name")
                    
                    let followingUser = User.followingList(uid: followingUid, displayName: followingUserName as! String)
                    completion(followingUser)
                        
                                        
                    
                })
            
            }}
            
        }
        
        
//        {
//        var followingRef = Database.database().reference().child("userList").child(currentUser.)

    }
//
//
//    func observeTagPool(completion: @escaping (Tag) -> Void) {
//
//        tagPoolRef.observe(.childAdded, with: {(snapshot) in
//
//            if let dic = snapshot.value as? [String: Any] {
//                let tagIDs = snapshot.key
//                let newTag = Tag.typeOneTag(ID: tagIDs, dic: dic)
//                completion(newTag)
//
//            }
//
//        })
//    }
//    }

//
//  user.swift
//  MapU01
//
//  Created by ting pan on 2020/9/16.
//  Copyright © 2020 MapU. All rights reserved.
//

import Foundation
class User {
    var uid: String?
    var displayName: String?
    var followingList: [Dictionary<String, Bool>]?
    var followerList: [Dictionary<String, Bool>]?
    }

extension User{
    
    static func followingList(uid: String, displayName: String) -> User {
           
        let user = User()
        user.uid = uid
        user.displayName = displayName

        return user
        }
    }

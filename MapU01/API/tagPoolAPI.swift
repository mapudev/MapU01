//
//  tagAPI.swift
//  MapU01
//
//  Created by ting pan on 2020/9/10.
//  Copyright © 2020 MapU. All rights reserved.
//

import Foundation
import FirebaseDatabase

class TagPoolAPI {
    
    var tagPoolRef = Database.database().reference().child("tagPool")
    
    func observeTagPool(completion: @escaping (Tag) -> Void) {
        
        tagPoolRef.observe(.childAdded, with: {(snapshot) in
            
            if let dic = snapshot.value as? [String: Any] {
                let tagIDs = snapshot.key
                let newTag = Tag.typeOneTag(ID: tagIDs, dic: dic)
                completion(newTag)
            
            }
            
        })
    }
    }
    
    


//
//  Tag.swift
//  MapU01
//
//  Created by ting pan on 2020/9/9.
//  Copyright © 2020 MapU. All rights reserved.
//

import Foundation
class Tag {
    var tagContent: String?
    var tagID: String?
    }

extension Tag{
    
    static func typeOneTag(ID: String, dic: [String: Any]) -> Tag {
           
        let tag = Tag()
        tag.tagContent = dic["tag"] as? String
        tag.tagID = ID
        
        return tag
        }
    }
   
    


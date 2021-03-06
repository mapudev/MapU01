//
//  ViewController.swift
//  MapU01
//
//  Created by ting pan on 2020/8/2.
//  Copyright © 2020 MapU. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import GameKit

class ViewController: UIViewController {

   
   
    @IBOutlet weak var friendA: UIButton!
    @IBOutlet weak var friendB: UIButton!
    @IBOutlet weak var randomTag: UILabel!
    @IBOutlet weak var inputTag: UITextField!
    var tagsForVote: [String] = []
    var userNameArr: [String] = []
    var tagArr = [Tag]()
    var TagInstanceForVote: Tag?
    var shuffledTagArr = [Tag]()
    var followingList = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //匿名登入
        Auth.auth().signInAnonymously { (authresult,error) in
            if error == nil{
                API.UserRef.userRef.child("\(authresult!.user.uid)").setValue(["name": "test"])
            print("signed-in \(authresult!.user.uid)")
           }else{
           print(error!.localizedDescription)
        }}
        
        fetchTagPool(completionHandler: { tagArr in
            self.shuffledTagArr = tagArr!.shuffled()
            self.TagInstanceForVote = self.outputRandomTagInstance(tagArr: self.shuffledTagArr)
          
            self.randomTag.text = self.TagInstanceForVote?.tagContent
        })
         
                   
        
        }
         

    typealias TagArrayClosure = ([Tag]?) -> Void

    //撈出tagPool底下所有資料匯入class並作為日後存取相關資料所用
    func fetchTagPool(completionHandler: @escaping TagArrayClosure) {
        var result = [Tag]()
        
            API.Tag.observeTagPool { tag in
                result.append(tag)
               
                DispatchQueue.main.async() {
                    if result.isEmpty {
                        completionHandler(nil)
                    }else {
                        completionHandler(result)
                      }
        }
    }
        
        
        
    }
    
    
    
    @IBAction func shareBtn(_ sender: UIButton) {
    }
    
    
        
    //吐出隨機標籤給前端
    func outputRandomTagInstance(tagArr: [Tag]) -> Tag {
        
        return tagArr[2]

//            shuffledArr = self.tagArr.shuffled()

        }

//        callback(shuffledArr[0])

        
        
           
    
    func test() {
        for i in self.shuffledTagArr {
            print(i.tagID!)
        }
        }
            
        
      
    
    @IBAction func test(_ sender: Any) {

       test()
        
        }
            
        
        
    
    
    
    typealias FollowingArrayClosure = ([User]?) -> Void
//    //撈出用戶名單陣列
    func fetchFollowingUser(completionHandler: @escaping FollowingArrayClosure) {
        
        var result = [User]()
        
        API.User.fetchFollowingList { followingUser in
            
            result.append(followingUser)
            
            DispatchQueue.main.async() {
                if result.isEmpty {
                    completionHandler(nil)
                }else {
                    completionHandler(result)
                  }
            
            }}
        }
    
 
    
    

////  吐出隨機朋友名字
////  待補：不能跟上一個 name 一樣
    func outputRandomFriend(followingUsers: [User]) ->(User, User) {
      
        var FriA = User()
        var FriB = User()

        if self.followingList.isEmpty { print("failed!!")
            
        }else{
            
            let FriShuffled = followingUsers.shuffled()
            FriA = FriShuffled[0]
            FriB = FriShuffled[1]
         
        }
        return (FriA, FriB)
   
    }

    func mergeTestContent() {
        
        print("YAAAAAAAAA")
    }
   
//兩顆朋友名字投票按鈕，要連結同一支程式，考慮用tag來控制
    @IBAction func friendA(_ sender: UIButton) {
        let randon2Fri = outputRandomFriend(followingUsers: self.followingList)
        sender.setTitle(randon2Fri.0.displayName, for: .normal)
        self.friendB.setTitle(randon2Fri.1.displayName, for: .normal)

//        outputRandomTagInstance { tagInstance in
//
//            randomTag.text = tagInstance.tagContent
//
//        }
        
                
    }
    
    

    
    @IBAction func friendB(_ sender: UIButton) {
//        let randon2Fri = outputRandomFriend()
//           sender.setTitle(randon2Fri.0, for: .normal)
//           self.friendA.setTitle(randon2Fri.1, for: .normal)
        
//        outputRandomTagInstance()

    }
    
//  下一步：將投票對象與標籤做關聯in firebase
//         要怎麼將對應的tagID寫到userID底下？
    func giveFriendTag(tagID: String, friendName: String, times: Int) {


        if let currentUser = Auth.auth().currentUser {
            API.UserRef.userRef.child(currentUser.uid).child("voteTag").child(tagID).child("for").setValue(true)

        }else{
print("faileddddd")        }
        }
    
      


// 提交tag函式
    func submitTags(newTag: String) {
        
        API.UserRef.userRefRoot.child("tagsFromUser").childByAutoId().setValue(["tag":newTag])
               
     }
    
// 提交tag鈕
    @IBAction func submit(_ sender: Any) {
        if let checkedInput = self.inputTag.text {
            submitTags(newTag: checkedInput)
            
            self.inputTag.text = ""

//            outputRandomTagInstance()

        }else{
            print("failed!!!!")
        }
        }
    
    

    
}


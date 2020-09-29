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

class ViewController: UIViewController {

    @IBOutlet weak var friendA: UIButton!
    @IBOutlet weak var friendB: UIButton!
    @IBOutlet weak var randomTag: UILabel!
    @IBOutlet weak var inputTag: UITextField!
    var tagsForVote: [String] = []
    var userNameArr: [String] = []
    var tagArr = [Tag]()
    var tagPool: Tag?
    var shuffledTagArr = [Tag]()
    var followingList = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //匿名登入
        Auth.auth().signInAnonymously { (authresult,error) in
            if error == nil{
            print("signed-in \(authresult!.user.uid)")
           }else{
           print(error!.localizedDescription)
        }}
        
        
        fetchTagPool() {tags in
            let shuffledtags = tags.shuffled()
            self.randomTag.text = shuffledtags[0].tagContent
        }
        
        fetchFriendName()
        }
         

    

    //撈出tagPool底下所有資料匯入class並作為日後存取相關資料所用
    func fetchTagPool(callback: @escaping ([Tag]) -> Void) {
//        DispatchQueue.global(qos: .utility).async {
            API.Tag.observeTagPool { tag in
                       self.tagArr.append(tag)
                callback(self.tagArr)
                   }
            
//            DispatchQueue.main.async {
                print(self.tagArr)
//            }}
    
}
   
           
//    func printIfNeeded() {
//        guard followingList.count > 1 else { return }
//        // Check the condition you need.
//
//        print(self.followingList[0].displayName)
//        print(self.followingList[1].displayName)
//    }
//
     
    func fetchfollowingList(callback: @escaping ([User]) -> Void) {

        API.User.fetchFollowingList { followingUser in
            DispatchQueue.main.async {
            self.followingList.append(followingUser)
            callback(self.followingList)
//            self.printIfNeeded()
            }
        }}
        
    // 將標籤實例隨機排序取出兩個實例
    func outputRandomTagInstance(callback: (Tag) -> Void) {

        let shuffledArr = self.tagArr.shuffled()
        
//        print(shuffledArr)
        callback(shuffledArr[0])
        
        
        
        }
        //        let randomTag = shuffledTag[0]
//        self.randomTag.text = randomTag.tagContent
        

    
    
    func test() {

        }
            
        
//          self.friendB.setTitle(followingUser[0].displayName, for: .normal)
//         self.friendA.setTitle(followingUser[1].displayName, for: .normal)
   
        
        
    
    
    
    @IBAction func test(_ sender: Any) {
        let tagID = self.tagArr[0].tagID ?? ""
        
        giveFriendTag(tagID: tagID)
        }
            
        
        
    
    
    
    
//    //撈出朋友名單陣列
    func fetchFriendName() ->[String] {

        API.UserRef.userRef.observe(.childAdded, with: { (snapshot) in
                if let userName = snapshot.childSnapshot(forPath: "name").value {
                    self.userNameArr.append(userName as? String ?? "noo")
                    }
        })
        return self.userNameArr
        }
    
    //建立根路徑
    
    
//撈出全部標籤＞確認每次撈取都是最新狀態的標籤池>吐出隨機標籤給前端
    func outputRandomTag() -> [String]{
        API.UserRef.userRefRoot.child("tagPool").observe(.childAdded) {
            (Snapshot) in
            for child in Snapshot.children {
                let tagKeyList = child as! DataSnapshot
                let tagValueList = tagKeyList.value as! String
                self.tagsForVote.append(tagValueList)

                }
                    
            }
        let shuffledTag = self.tagsForVote.shuffled()
        return shuffledTag
        
        
        }
        
 
    
     
    
    
    
    

////  吐出隨機朋友名字
////  待補：不能跟上一個 name 一樣
//    func outputRandomFriend() ->(String, String) {
//       let FriShuffled = self.userNameArr.shuffled()
//        let FriA = FriShuffled[0]
//        let FriB = FriShuffled[1]
//
//        return (FriA, FriB)
   
//    }

//兩顆朋友名字投票按鈕，要連結同一支程式，考慮用tag來控制
    @IBAction func friendA(_ sender: UIButton) {
//    let randon2Fri = outputRandomFriend()
//    sender.setTitle(randon2Fri.0, for: .normal)
//    self.friendB.setTitle(randon2Fri.1, for: .normal)
//
//        outputRandomTagInstance()
    }
    
    @IBAction func friendB(_ sender: UIButton) {
//        let randon2Fri = outputRandomFriend()
//           sender.setTitle(randon2Fri.0, for: .normal)
//           self.friendA.setTitle(randon2Fri.1, for: .normal)
        
//        outputRandomTagInstance()

    }
    
//  下一步：將投票對象與標籤做關聯in firebase
//         要怎麼將對應的tagID寫到userID底下？
    func giveFriendTag(tagID: String) {


        if let currentUser = Auth.auth().currentUser {
            API.UserRef.userRef.child(currentUser.uid).child("voteTag").child(tagID).setValue(true)

        }else{
print("faileddddd")        }
        }
    
      


// 提交tag
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


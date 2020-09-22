//
//  TestArchiveViewController.swift
//  MapU01
//
//  Created by ting pan on 2020/8/26.
//  Copyright © 2020 MapU. All rights reserved.
//

import UIKit



class TestArchiveViewController: UIViewController {
    
    @IBOutlet weak var submitTag: UITextField!
    @IBOutlet weak var randomTag: UILabel!
    var tagsForVote: [String] = []
    var friendsForVote: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //匿名登入
//               Auth.auth().signInAnonymously { (authresult,error) in
//                   if error == nil{
//
//                       print("signed-in \(authresult!.user.uid)")
//
//                   }else{
//
//                       print(error!.localizedDescription)
//
//                   }
//               }
    }
    
    //        考慮要建立一個 func 執行隨機撈取朋友 name
//
//            let usersRef = Database.database().reference()
//            usersRef.child("userList").observe(.childAdded, with: { (snapshot) in
//                let userName = snapshot.childSnapshot(forPath: "name").value as? String ?? "no name"
//                 self.friendsForVote.append(userName)
//
//                let friendForVoteIndex = GKRandomSource.sharedRandom().nextInt(upperBound: self.friendsForVote.count)
//
//                let randomFriendForVote = self.friendsForVote[friendForVoteIndex]
//
//                })
    
    
    //隨機出現投票標籤＞確認每次撈取都是最新狀態的標籤池
    //        let tagRef = Database.database().reference()
    //
    //        tagRef.child("test").observe(.childAdded) { (Snapshot) in
    //
    //            if let tagForVote = Snapshot.value as? String {
    //
    //                self.tagsForVote.append(tagForVote)
    //
    //                let tagsForVoteIndex = GKRandomSource.sharedRandom().nextInt(upperBound: self.tagsForVote.count)
    //
    //                self.randomTag.text = self.tagsForVote[tagsForVoteIndex]
    //            }
    //           }

    
    //隨機取出兩名用戶name
    //        let nameRef = Database.database().reference()
    //
    //        nameRef.child("userList").observe(.childAdded) { (Snapshot) in
    //
    //            if let nameForVote = Snapshot.value as? String {
    //                self.friendsForVote.append(nameForVote)
    //
    //                 let friendsForVoteIndex = GKRandomSource.sharedRandom().nextInt(upperBound: self.friendsForVote.count)
    //
    //                print(self.friendsForVote[friendsForVoteIndex])
    //                // 要怎麼把用戶 name 顯示到按鈕上面？
    //
    //            }else{
    //                return
    //            }
    //
    //
    //        }
            
   //        let tagForVote = Database.database().reference(withPath: "test/tag0001")
   //
   //        tagForVote.observe(.value) { (snapshot) in
   //
   //            if let tag = snapshot.value {
   //                self.randomTag.text = tag as? String
   //                self.submitTag.becomeFirstResponder()
   //            }
   //        }

    
       //提交tag到後台資料庫(不work, 要修)
    //    @IBAction func submit(_ sender: UIButton) {
    //
    //        if let submittedTag = submitTag.text {
    //
    //                    if submittedTag != "" {
    //
    //                        let tagForVote = Database.database().reference()
    //                        tagForVote.child("tag0001").setValue(submittedTag)
    //
    //                    }
    //
    //                }
    //
    //    }
    
    
}

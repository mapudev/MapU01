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
    var votedTag: Tag?
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
        
        fetchTagPool(completionHandler: { tagArr in
            self.shuffledTagArr = tagArr!.shuffled()
            self.randomTag.text = self.shuffledTagArr[3].tagContent
          
            print(self.shuffledTagArr.count)
            
        })
         
                   
        
        }
         
    //撈出tagPool底下所有資料匯入class並作為日後存取相關資料所用
    typealias TagArrayClosure = ([Tag]?) -> Void

    
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
    
            
    func test() {
        
        
    }
      
    
    @IBAction func test(_ sender: Any) {
test()
//        if self.shuffledTagArr.isEmpty { return
//
//
//        }else{
//          let number = GKRandomSource.sharedRandom().nextInt(upperBound: self.shuffledTagArr.count)
            
//            print(self.shuffledTagArr[2].tagContent)
            
//        }
        
        }
         


    @IBAction func friendA(_ sender: UIButton) {
   
        }
    
    
    @IBAction func friendB(_ sender: UIButton) {

    }


    
    @IBAction func submit(_ sender: Any) {
      
        }
    
}


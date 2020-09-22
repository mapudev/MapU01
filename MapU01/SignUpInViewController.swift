//
//  SignUpInViewController.swift
//  MapU01
//
//  Created by ting pan on 2020/8/9.
//  Copyright © 2020 MapU. All rights reserved.
//

import UIKit
import FirebaseAuth


class SignUpInViewController: UIViewController {

    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var verificationCode: UITextField!
    @IBOutlet weak var loginStatus: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLoginStatus()
             
         // Do any additional setup after loading the view.
    }
    
    func showMsg(message: String) {
        print(message)
    }
        
    
    @IBAction func checkPhoneNumber(_ sender: Any) {
    
        if let thePhone = phoneNumber.text {
            //需檢查電話號碼格式
            PhoneAuthProvider.provider().verifyPhoneNumber(thePhone, uiDelegate: nil, completion: {
                (verificationID, error) in
                if error == nil {
                    UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                    self.showMsg(message: "收簡訊")
                    self.view.endEditing(true)
                    
                }else{
                    UIAlertController(title: "oops!", message: "Wrong!!!!!", preferredStyle: .alert)
                }
                
                
            })
            
            
        }}
    
    
    @IBAction func verify(_ sender: Any) {
        if let verification = verificationCode.text,
            let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") {
            
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verification)
            Auth.auth().signIn(with: credential) { (user, error) in
                 if error == nil {
                    self.updateLoginStatus()
                    self.view.endEditing(true)
                    print("login succeed!")
                }else{
                    self.showMsg(message: "錯誤：\(error!.localizedDescription)")
                    
                    
                }
            }
        }}
    
     
    
    @IBAction func signOut(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            self.updateLoginStatus()
        } catch  {
            print(error.localizedDescription)
        }
        
    }
    
    
    
    
    func updateLoginStatus() {

        if let _ = Auth.auth().currentUser {

//            let last4Char = (user.phoneNumber! as NSString).substring(from: 9)

            loginStatus.text = "已登入"

        }else{

            loginStatus.text = "please login"
        }

    }


    

}

//
//  ViewController.swift
//  DevslopesSocial
//
//  Created by Thad Duval on 12/28/16.
//  Copyright © 2016 Thad Duval. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import FirebaseAuth

class SignInVC: UIViewController {

    @IBOutlet weak var emailField: FancyTextField!
    
    @IBOutlet weak var passwordField: FancyTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self, handler: { (result, error) in
            if error != nil {
                print("TADTADTAD: Unable to authenticate with Facebook - \(error)")
            } else if result? .isCancelled == true {
                print("TADTADTAD: User cancelled Facebook authentication")
            } else {
                print("TADTADTAD: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                
                self.firebaseAuth(credential)
            }
        })
    }
    
    func firebaseAuth(_ credential:FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("TADTADTAD: Unable to authenticate with Firebase - \(error)")
            } else  {
                print("TADTADTAD: Successfully authenticated with Firebase")
            }
        })
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        
        if let email = emailField.text, let pwd = passwordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user,error) in
                    if error == nil {
                        print("TADTADTAD: User authenticated with Firebase")
                    } else {
                        FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                            if error != nil {
                                print("TADTADTAD: Unable to authentiate with Firebase using email")
                            } else {
                                print("TADTADTAD: Successfully authenticated with Frebase")
                            }
                        })
                    }
            })
        }
        
    }
    

}


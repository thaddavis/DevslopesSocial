//
//  FeedVC.swift
//  DevslopesSocial
//
//  Created by Thad Duval on 12/29/16.
//  Copyright © 2016 Thad Duval. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        DataService.ds.REF_POSTS.observe(.value, with: {
            (snapshot) in
                if let snap = snapshot.children.allObjects as? [FIRDataSnapshot] {
                    for s in snap {
                        
                        print("SNAP: \(s)")
                        
                        if let postDict = s.value as? Dictionary<String, AnyObject> {
                            let key = s.key
                            let post = Post(postKey: key, postData: postDict)
                            
                            self.posts.append(post)
                        }
                    }
                }
            
            self.tableView.reloadData()
            
        })
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
            cell.configureCell(post: post)
            return cell
        } else {
            return PostCell()
        }
    }
    
    @IBAction func signOutTapped(_ sender: Any) {
        let removeSuccessful: Bool = KeychainWrapper.standard.remove(key: KEY_UID)
        
        if removeSuccessful {
            try! FIRAuth.auth()?.signOut()
            performSegue(withIdentifier: "goToSignin", sender: nil)
        }
        
    }
    
    
}

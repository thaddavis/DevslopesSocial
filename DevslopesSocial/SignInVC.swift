//
//  ViewController.swift
//  DevslopesSocial
//
//  Created by Thad Duval on 12/28/16.
//  Copyright © 2016 Thad Duval. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {

    
    @IBOutlet weak var headerImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerImageView.image = UIImage(named: "BONERNEWSNETWORKLOGO")
        headerImageView.backgroundColor = UIColor.white
        headerImageView.layer.cornerRadius = 65.0
        headerImageView.clipsToBounds = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


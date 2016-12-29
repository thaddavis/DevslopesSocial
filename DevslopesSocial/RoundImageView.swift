//
//  RoundImageView.swift
//  DevslopesSocial
//
//  Created by Thad Duval on 12/29/16.
//  Copyright © 2016 Thad Duval. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.7).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 0.5
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.image =  UIImage(named:"BONERNEWSNETWORKLOGO")
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width / 2
    }

}

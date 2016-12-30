//
//  PostCell.swift
//  DevslopesSocial
//
//  Created by Thad Duval on 12/29/16.
//  Copyright © 2016 Thad Duval. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likeLbl: UILabel!
    
    var post: Post!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(post: Post) {
        self.post = post
        self.caption.text = post.caption
        self.likeLbl.text = "\(post.likes)"
    }

}

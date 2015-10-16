//
//  NewsFeedTableViewCell.swift
//  Tiller
//
//  Created by Thomas Gibbons on 9/30/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

protocol cellDelegate
{
    func toUserProfile(forUser: String)
    //string will later be changed to the user
    
}

class NewsFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var poster: UIButton!
    @IBOutlet weak var posterNameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    var delegate : cellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.posterImageView.layer.cornerRadius = self.posterImageView.frame.size.height/4
//        self.posterImageView.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func profileButton(sender: AnyObject)
    {
        delegate?.toUserProfile(posterNameLabel.text!)
    }

}

//
//  ProfileVC.swift
//  Tiller
//
//  Created by Thomas Gibbons on 8/17/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var profileImageView: UIImageView!
    var tableDataArray = ["I hate this candidate", "I love this candidate", "I am indifferent towards this candidate", "I hate this candidate", "I love this candidate", "I am indifferent towards this candidate", "I hate this candidate", "I love this candidate", "I am indifferent towards this candidate"]
    var tableDataArrayTwo = ["Endorsed Obama", "Pledged Rand Paul", "Disapproved of Joe Biden", "Donated to Bernie Sanders","Endorsed Obama", "Pledged Rand Paul", "Disapproved of Joe Biden", "Donated to Bernie Sanders"]

    @IBOutlet weak var postsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.backgroundColor = UIColor.redColor()
        profileImageView.layer.cornerRadius = 10.0
        profileImageView.image = UIImage(named: "deathBed")
        profileImageView.clipsToBounds = true

        
    }
    

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellID") as! UITableViewCell
        cell.textLabel?.text = tableDataArray[indexPath.row]
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataArray.count
    }

}

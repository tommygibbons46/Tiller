//
//  HomeViewController.swift
//  Tiller
//
//  Created by Thomas Gibbons on 10/1/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, postDelegate, cellDelegate {


    @IBOutlet weak var newsFeedTableView: UITableView!
    
    @IBOutlet weak var newPostView: UIView!
    var imagesArray = ["bush", "carson","christie", "trump","bush", "carson","christie", "trump","bush", "carson","christie", "trump"]
    var posterNamesArray = ["Jeb Bush", "Ben Carson", "Chris Christie", "Donald Trump","Jeb Bush", "Ben Carson", "Chris Christie", "Donald Trump","Jeb Bush", "Ben Carson", "Chris Christie", "Donald Trump"]
    var textArray = ["I am an extremely important man", "I am a local conservative", "Check out my new policy on closing bridges", "alsdflasdjfalsdfjadslfjdasdfladsjfdaslfjalsdfjadslkvjadfs;lkjasdl;kfjdslkjgaslkgjfdl;kgjfdlkgvaflkgja, Really long text really long text Really long text really long text Really long text really long text Really long text really long text", "I am an extremely important man", "I am a local conservative", "Check out my new policy on closing bridges", "Really long text really long text Really long text really long text Really long text really long text Really long text really long text","I am an extremely important man", "I am a local conservative", "Check out my new policy on closing bridges", "Really long text really long text Really long text really long text Really long text really long text Really long text really long text"]

    override func viewDidLoad() {
        super.viewDidLoad()
        newsFeedTableView.rowHeight = UITableViewAutomaticDimension
        newsFeedTableView.estimatedRowHeight = 200
        

 
    }
    
    override func viewWillAppear(animated: Bool) {
//        newsFeedTableView.reloadData()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let postVC = storyboard.instantiateViewControllerWithIdentifier("post") as! PostViewController
//        postVC.delegate = self
//        print(postVC.delegate)
    }
    
    func createNewPost()
    {
        newPostView.hidden = false
        
    }
   
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellID") as! NewsFeedTableViewCell
        cell.posterImageView.image = UIImage(named: imagesArray[indexPath.row])
        cell.posterNameLabel.text = posterNamesArray[indexPath.row]
        cell.delegate = self
        cell.messageLabel.text = textArray[indexPath.row]
        cell.layoutIfNeeded()
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posterNamesArray.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        newsFeedTableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    func userPosts(message: String) {
        print("heyy there got here")
        textArray.append(message)
//        var number = random()
        var number = (Int(arc4random()) % posterNamesArray.count)

        posterNamesArray.append(posterNamesArray[number])
//        var count = posterNamesArray.count
        
        imagesArray.append(imagesArray[number])
        self.newsFeedTableView.reloadData()
        
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "post"
        {
            let nav = segue.destinationViewController as! UINavigationController
            let postVC = nav.topViewController as! PostViewController
            
            postVC.delegate = self
        }
    }
    
    func toUserProfile(forUser: String) {
        self.performSegueWithIdentifier("profile", sender: nil)
        
    }

    
}

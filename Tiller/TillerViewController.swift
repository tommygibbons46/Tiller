//
//  TillerViewController.swift
//  Tiller
//
//  Created by Thomas Gibbons on 8/17/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

class TillerViewController: UIViewController, NSURLConnectionDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var officialsOrCandidates: UISegmentedControl!
    
    @IBOutlet weak var TillerTableView: UITableView!
    
    var candidates : Bool?
    
    let imagesArray = ["bush", "carson","christie", "trump"]

    @IBOutlet weak var candidatesOrOfficials: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false

        let url = NSURL(string: "https://staging.voteraide.com/api/users")
        let request = NSURLRequest(URL: url!)
        let connection = NSURLConnection(request: request, delegate: self, startImmediately: true)

        candidates = false
        
//        self.TillerTableView.rowHeight = UITableViewAutomaticDimension
//        self.TillerTableView.estimatedRowHeight = 400
    }
    
    func connection(connection: NSURLConnection, didReceiveAuthenticationChallenge challenge: NSURLAuthenticationChallenge) {
        println("received a challenge")
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        println("here is our error: \(error)")

    }
    
    func connection(connection: NSURLConnection, willSendRequestForAuthenticationChallenge challenge: NSURLAuthenticationChallenge) {
        
        let credential = NSURLCredential(forTrust: challenge.protectionSpace.serverTrust)
        
        challenge.sender.useCredential(credential, forAuthenticationChallenge: challenge)
        challenge.sender.continueWithoutCredentialForAuthenticationChallenge(challenge)
    }
  
    func rotate()
    {
//        let degrees = 20
//        tiller.transform = CGAffineTransformMakeRotation(CGFloat(70 * M_PI/180))
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if officialsOrCandidates.selectedSegmentIndex == 0
        {
            var cell = tableView.dequeueReusableCellWithIdentifier("Official") as! TillerOfficialTableViewCell
        
            cell.officialsImageView.image = UIImage(named: imagesArray[indexPath.row])

            return cell
        }
        else
        {
            var cell = tableView.dequeueReusableCellWithIdentifier("Candidates") as! UITableViewCell
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return imagesArray.count
    }
    
    @IBAction func candidatesOrOfficialsTape(sender: AnyObject)
    {
        
    }
    

    @IBAction func segmentControlTap(sender: AnyObject)
    {
        print(sender.selectedSegmentIndex)
        self.TillerTableView.reloadData()

    }
   
}

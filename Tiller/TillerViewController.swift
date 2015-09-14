//
//  TillerViewController.swift
//  Tiller
//
//  Created by Thomas Gibbons on 8/17/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

class TillerViewController: UIViewController, NSURLConnectionDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tillerTableView: UITableView!
    
    @IBOutlet weak var tiller: UIView!
    var candidates : Bool?

    @IBOutlet weak var candidatesOrOfficials: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

//        let tapGesture = UITapGestureRecognizer(target: self, action: "rotate")
//        self.view.addGestureRecognizer(tapGesture)

        let url = NSURL(string: "https://staging.voteraide.com/api/users")
        let request = NSURLRequest(URL: url!)
        let connection = NSURLConnection(request: request, delegate: self, startImmediately: true)
//        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
//            
//            println(response)
//            println(data)
//            println(error)
//        }
        candidates = false
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
        tiller.transform = CGAffineTransformMakeRotation(CGFloat(70 * M_PI/180))
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if candidates == false
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("Official") as! TillerOfficialTableViewCell
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("cellID") as! TillerTableViewCell
            
            cell.candidateName.text = "Ronald Regean"
            return cell
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    @IBAction func candidatesOrOfficialsTape(sender: AnyObject)
    {
        
    }

   
}

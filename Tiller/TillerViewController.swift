//
//  TillerViewController.swift
//  Tiller
//
//  Created by Thomas Gibbons on 8/17/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

class TillerViewController: UIViewController, NSURLConnectionDelegate, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var officialsOrCandidates: UISegmentedControl!
    
    @IBOutlet weak var TillerTableView: UITableView!
    var lastTouchedCell : TillerOfficialTableViewCell?
    var candidates : Bool?
    var expandedIndexPath : NSIndexPath?
    let imagesArray = ["bush", "carson","christie", "trump"]
    let officesArray = ["President", "Senator", "Congress", "Mayor"]
    var tapRecognizer = UITapGestureRecognizer()
    @IBOutlet weak var candidatesOrOfficials: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false

        let url = NSURL(string: "https://staging.voteraide.com/api/users")
        let request = NSURLRequest(URL: url!)
        let connection = NSURLConnection(request: request, delegate: self, startImmediately: true)

        candidates = false
        
        self.TillerTableView.rowHeight = UITableViewAutomaticDimension
        self.TillerTableView.estimatedRowHeight = 400
    }
    
    
//    func connection(connection: NSURLConnection, didReceiveAuthenticationChallenge challenge: NSURLAuthenticationChallenge) {
//        print("received a challenge", terminator: "")
//    }
//    
//    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
//        print("here is our error: \(error)")
//
//    }
//    
//    func connection(connection: NSURLConnection, willSendRequestForAuthenticationChallenge challenge: NSURLAuthenticationChallenge) {
//        
//        let credential = NSURLCredential(forTrust: challenge.protectionSpace.serverTrust!)
//        
//        challenge.sender.useCredential(credential, forAuthenticationChallenge: challenge)
//        challenge.sender!.continueWithoutCredentialForAuthenticationChallenge(challenge)
//    }
  
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        
        if officialsOrCandidates.selectedSegmentIndex == 0
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("Official") as! TillerOfficialTableViewCell
            if indexPath == expandedIndexPath
            {
                print("should be hiding")
                cell.tiller.hidden = false
            }
            else
            {
                cell.tiller.hidden = true
            }
            
            cell.officialsImageView.image = UIImage(named: imagesArray[indexPath.row])

            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("Candidates") as! CarouselTableViewCell
            cell.selectedImageview.backgroundColor = UIColor.lightGrayColor()
//            cell.officeLabel.text = officesArray[indexPath.row]
//            cell.officeLabel.textColor = UIColor.whiteColor()
            return cell
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesArray.count
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if officialsOrCandidates.selectedSegmentIndex == 0
        {
            if indexPath == expandedIndexPath
            {
                
                return 275
            }
            else
            {
                return 100
            }
        }
        else
        {
            return 250
        }


    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if officialsOrCandidates.selectedSegmentIndex == 0
        {
            tableView.deselectRowAtIndexPath(indexPath, animated: false)
            var cell = tableView.cellForRowAtIndexPath(indexPath) as! TillerOfficialTableViewCell
            tableView.beginUpdates()
            if indexPath == expandedIndexPath
            {
                print("tap on a tap")
            }
            else
            {
                expandedIndexPath = indexPath
                if (lastTouchedCell != nil)
                {
                    lastTouchedCell?.removeGestureRecognizer(tapRecognizer)
                    lastTouchedCell?.tiller.hidden = true
                }
                var cell = tableView.cellForRowAtIndexPath(indexPath) as! TillerOfficialTableViewCell
                cell.tiller.hidden = false
//                let button = UIButton(frame: CGRectMake(0, 0, 110, 30))
//                button.center = cell.center
//                button.setTitle("Neutral", forState: UIControlState.Normal)
//                button.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//                cell.addSubview(button)
                tapRecognizer = UITapGestureRecognizer(target: self, action: "ourTap:")
                cell.addGestureRecognizer(tapRecognizer)
                lastTouchedCell = cell
                
                //we just added a gesture recognizer, but now we need to remove the recognizer from every other cell
                print("new tap")
            }
            tableView.endUpdates()
        }
    }
    

    
    func ourTap(tap: UIGestureRecognizer)
    {
        let location = tap.locationInView(self.view)
        var cell = tap.view as! TillerOfficialTableViewCell
        if location.x > self.view.frame.width/2
        {
            cell.turnRight()
        }
        else
        {
            cell.turnLeft()
        }
        
    }

    @IBAction func segmentControlTap(sender: AnyObject)
    {
        print(sender.selectedSegmentIndex, terminator: "")
        self.TillerTableView.reloadData()

    }
   
}

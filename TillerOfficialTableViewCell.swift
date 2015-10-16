//
//  TillerOfficialTableViewCell.swift
//  Tiller
//
//  Created by Thomas Gibbons on 9/14/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

class TillerOfficialTableViewCell: UITableViewCell {

    @IBOutlet weak var officialImageView: UIImageView!
    
    @IBOutlet weak var officialsImageView: UIImageView!
    
    @IBOutlet weak var tiller: UIImageView!
    
    @IBOutlet weak var neutralButton: UIButton!
    
    var left: Bool?
   
    @IBAction func neutralButtonTap(sender: AnyObject)
    {
        let duration : NSTimeInterval = 0.5
        let delay :NSTimeInterval = 1.0
        let damping : CGFloat = 0.5
        let animationVelocity : CGFloat = 0.4
        
        if left == true
        {
            UIView.animateWithDuration(duration,
                delay: 0.0,
                usingSpringWithDamping: damping,
                initialSpringVelocity: animationVelocity,
                options: .CurveEaseInOut,
                animations: {
                    self.tiller.transform = CGAffineTransformMakeRotation(CGFloat(-0))
                },
                completion: {success in })
        }
        
        else
        {
            UIView.animateWithDuration(duration,
                delay: 0.0,
                usingSpringWithDamping: damping,
                initialSpringVelocity: animationVelocity,
                options: .CurveEaseInOut,
                animations: {
                    self.tiller.transform = CGAffineTransformMakeRotation(CGFloat(0))
                },
                completion: {success in })
        }

        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tiller.hidden = true
        // Initialization code
    }
    
    func turnLeft()
    {
//        self.tiller.hidden = true
        let duration : NSTimeInterval = 1.0
        let delay :NSTimeInterval = 1.0
        let damping : CGFloat = 0.3
        let animationVelocity : CGFloat = 0.5
        UIView.animateWithDuration(duration,
            delay: 0.0,
            usingSpringWithDamping: damping,
            initialSpringVelocity: animationVelocity,
            options: .CurveEaseInOut,
            animations: {
               
                self.tiller.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI/4))
            },
            completion: {success in })
        
        left = true
    }
    
    func turnRight()
    {
        let duration : NSTimeInterval = 1.0
        let delay :NSTimeInterval = 1.0
        let damping : CGFloat = 0.3
        let animationVelocity : CGFloat = 0.5
        UIView.animateWithDuration(duration,
            delay: 0.0,
            usingSpringWithDamping: damping,
            initialSpringVelocity: animationVelocity,
            options: .CurveEaseInOut,
            animations: {
                
                self.tiller.transform = CGAffineTransformMakeRotation(CGFloat(M_PI/4))
            },
            completion: {success in })
        left = false
    }

    override func setSelected(selected: Bool, animated: Bool) {

    }
    

    


}

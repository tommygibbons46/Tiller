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
    }

    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        if let touch:UITouch = touches.first!
//        {
//            
//            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height + 100)
//            
//            var touchPosition = touch.locationInView(self.contentView)
//            let currentPosition = tiller.frame.origin
//            var angleR = atan2(currentPosition.y - touchPosition.y, currentPosition.x - touchPosition.x)
//            let duration : NSTimeInterval = 1.0
//            let delay :NSTimeInterval = 1.0
//            let damping : CGFloat = 0.3
//            let animationVelocity : CGFloat = 0.5
//            
//            angleR = 150
//            
//            if touchPosition.x < self.contentView.frame.maxX/2
//            {
//                
//                UIView.animateWithDuration(duration,
//                    delay: 0.0,
//                    usingSpringWithDamping: damping,
//                    initialSpringVelocity: animationVelocity,
//                    options: .CurveEaseInOut,
//                    animations: {
//                        //                    self.leftPupil.transform = CGAffineTransformMakeRotation(angleL + CGFloat(M_PI/2))
//                        self.tiller.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI/4))
//                    },
//                    completion: {success in })
//            }
//            else
//            {
//                UIView.animateWithDuration(duration,
//                    delay: 0.0,
//                    usingSpringWithDamping: damping,
//                    initialSpringVelocity: animationVelocity,
//                    options: .CurveEaseInOut,
//                    animations: {
//                        //                    self.leftPupil.transform = CGAffineTransformMakeRotation(angleL + CGFloat(M_PI/2))
//                        self.tiller.transform = CGAffineTransformMakeRotation(CGFloat(M_PI/4))
//                    },
//                    completion: {success in })
//            }
//        }
//    }
    


}

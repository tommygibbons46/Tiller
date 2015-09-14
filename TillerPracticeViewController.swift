//
//  TillerPracticeViewController.swift
//  Tiller
//
//  Created by Thomas Gibbons on 9/11/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

class TillerPracticeViewController: UIViewController {
    
    @IBOutlet weak var leftPupil: UIImageView!
    @IBOutlet weak var rightPupil: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if let touch:UITouch = touches.first as? UITouch {
            
            
            
            var touchPosition = touch.locationInView(self.view)
            let currentPositionR = rightPupil.frame.origin
            var angleR = atan2(currentPositionR.y - touchPosition.y, currentPositionR.x - touchPosition.x)
            let duration : NSTimeInterval = 1.0
            let delay :NSTimeInterval = 1.0
            let damping : CGFloat = 0.3
            let animationVelocity : CGFloat = 0.5
            
            angleR = 150

            if touchPosition.x < self.view.frame.maxX/2
            {
                
                UIView.animateWithDuration(duration,
                    delay: 0.0,
                    usingSpringWithDamping: damping,
                    initialSpringVelocity: animationVelocity,
                    options: .CurveEaseInOut,
                    animations: {
                        //                    self.leftPupil.transform = CGAffineTransformMakeRotation(angleL + CGFloat(M_PI/2))
                        self.rightPupil.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI/4))
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
                        //                    self.leftPupil.transform = CGAffineTransformMakeRotation(angleL + CGFloat(M_PI/2))
                        self.rightPupil.transform = CGAffineTransformMakeRotation(CGFloat(M_PI/4))
                    },
                    completion: {success in })
            }
            // Gets the eye's center
//            let currentPositionL = leftPupil.frame.origin
            
            
            // Calculates angle between touch position and the eyes
//            var angleL = atan2(currentPositionL.y - touchPosition.y, currentPositionL.x - touchPosition.x)
          
            
            
            // usingSpringWithDamping

            
            
        }
    }
    
//    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
//        if let touch:UITouch = touches.first as? UITouch {
//            
//            var touchPosition = touch.locationInView(self.view)
//            
////            let currentPositionL = leftPupil.frame.origin
//            let currentPositionR = rightPupil.frame.origin
//            
////            var angleL = atan2(currentPositionL.y - touchPosition.y, currentPositionL.x - touchPosition.x)
//            var angleR = atan2(currentPositionR.y - touchPosition.y, currentPositionR.x - touchPosition.x)
//            
////            leftPupil.transform = CGAffineTransformMakeRotation(angleL + CGFloat(M_PI/2))
//            rightPupil.transform = CGAffineTransformMakeRotation(angleR + CGFloat(M_PI/2))
//            
//            
//        }
//    }
    
    
}



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
    
    @IBOutlet weak var tiller: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        officialImageView.image = UIImage(named: "bush")
    }

    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if let touch:UITouch = touches.first as? UITouch {
            
            
            
            var touchPosition = touch.locationInView(self.contentView)
            let currentPosition = tiller.frame.origin
            var angleR = atan2(currentPosition.y - touchPosition.y, currentPosition.x - touchPosition.x)
            let duration : NSTimeInterval = 1.0
            let delay :NSTimeInterval = 1.0
            let damping : CGFloat = 0.3
            let animationVelocity : CGFloat = 0.5
            
            angleR = 150
            
            if touchPosition.x < self.contentView.frame.maxX/2
            {
                
                UIView.animateWithDuration(duration,
                    delay: 0.0,
                    usingSpringWithDamping: damping,
                    initialSpringVelocity: animationVelocity,
                    options: .CurveEaseInOut,
                    animations: {
                        //                    self.leftPupil.transform = CGAffineTransformMakeRotation(angleL + CGFloat(M_PI/2))
                        self.tiller.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI/4))
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
                        self.tiller.transform = CGAffineTransformMakeRotation(CGFloat(M_PI/4))
                    },
                    completion: {success in })
            }
        }
    }
    


}

//
//  CarouselTableViewCell.swift
//  Tiller
//
//  Created by Thomas Gibbons on 9/15/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

class CarouselTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var officeLabel: UILabel!
    
  
    
    let imagesArray = ["bush", "carson","christie", "trump"]
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellID", forIndexPath: indexPath) as! CarouselCollectionViewCell
//        let imageView = UIImageView(frame: cell.frame)
//        imageView.backgroundColor = UIColor.blueColor()
//        imageView.image = UIImage(named: imagesArray[indexPath.item])
        
        let imagePath = imagesArray[indexPath.item]
        
        let image = UIImage(named: imagePath)
        cell.candidateImage.image = image
        return cell
    }
    
    
    
    

}

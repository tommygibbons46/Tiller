//
//  TillerCandidatesTableViewCell.swift
//  Tiller
//
//  Created by Thomas Gibbons on 9/14/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

class TillerCandidatesTableViewCell: UITableViewCell {

    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var pageImages: [UIImage] = []
    var pageViews: [UIImageView?] = []
    var candidates: [String?] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pageImages = [UIImage(named: "bush")!,
            UIImage(named: "trump")!,
            UIImage(named: "christie")!,
            UIImage(named: "carson")!]
        
        
        candidates = ["Jeb Bush", "Donald Trump", "Chris Christie", "Ben Carson"]
        
        let pageCount = pageImages.count

        // 2
//        pageControl.currentPage = 0
//        pageControl.numberOfPages = pageCount
//        
//        // 3
//        for _ in 0..<pageCount {
//            pageViews.append(nil)
//        }
//        
//        // 4
//        let pagesScrollViewSize = scrollView.frame.size
//        scrollView.contentSize = CGSize(width: pagesScrollViewSize.width * CGFloat(pageImages.count),
//            height: pagesScrollViewSize.height)
//        
//        // 5
//        loadVisiblePages()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadVisiblePages() {
        // First, determine which page is currently visible
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        
        // Update the page control
        pageControl.currentPage = page
        
        // Work out which pages you want to load
        let firstPage = page - 1
        let lastPage = page + 1
        
        // Purge anything before the first page
        for var index = 0; index < firstPage; ++index {
            purgePage(index)
        }
        
        // Load pages in our range
        for index in firstPage...lastPage {
            loadPage(index)
        }
        
        // Purge anything after the last page
        for var index = lastPage+1; index < pageImages.count; ++index {
            purgePage(index)
        }
    }
    
    func loadPage(page: Int) {
        if page < 0 || page >= pageImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // 1
        if let pageView = pageViews[page] {
            // Do nothing. The view is already loaded.
        } else {
            // 2
            var frame = scrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(page)
            frame.origin.y = 0.0
            
            // 3
            let newPageView = UIImageView(image: pageImages[page])
            newPageView.contentMode = .ScaleAspectFit
            newPageView.frame = frame
            let label = UILabel()
            label.backgroundColor = UIColor.clearColor()
            label.text = candidates[page]
            label.frame = frame
            
            scrollView.addSubview(newPageView)
            scrollView.addSubview(label)
            
            // 4
            pageViews[page] = newPageView
        }
    }
    
    func purgePage(page: Int) {
        if page < 0 || page >= pageImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // Remove a page from the scroll view and reset the container array
        if let pageView = pageViews[page] {
            pageView.removeFromSuperview()
            pageViews[page] = nil
        }
    }

    
    

}

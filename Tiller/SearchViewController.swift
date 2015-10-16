//
//  SearchViewController.swift
//  Tiller
//
//  Created by Thomas Gibbons on 8/21/15.
//  Copyright (c) 2015 Thomas Gibbons. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let navBarFrame = self.navigationController?.navigationBar.frame
        let frame = CGRectMake(-5.0, 0.0, 320.0, 44.0)
        let searchBar = UISearchBar(frame: frame)
        let viewFrame = CGRectMake(0.0, 0.0, 310.0, 44.0)
        let searchBarView = UIView(frame: frame)
        searchBarView.addSubview(searchBar)
        self.navigationItem.titleView = searchBarView
        // Do any additional setup after loading the view.
    }


}

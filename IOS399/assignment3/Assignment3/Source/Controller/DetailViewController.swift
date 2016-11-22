//
//  DetailView.swift
//  Assignment3
//
//  Created by Zhexin Jia on 7/16/16.
//  Copyright © 2016 CIS 410. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    static var counter = 0
    @IBOutlet weak var showLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let showCounter = DetailViewController.incrementCounter()
        showLabel.text = "Detail View pushed \(showCounter) times"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    static func incrementCounter() ->Int{
        counter += 1
        return counter
    }


}

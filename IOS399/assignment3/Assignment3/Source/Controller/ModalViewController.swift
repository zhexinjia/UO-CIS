//
//  ModalViewController.swift
//  Assignment3
//
//  Created by Zhexin Jia on 7/16/16.
//  Copyright © 2016 CIS 410. All rights reserved.
//

import UIKit
protocol sendingInformation {
    func sendString(info:String)
}

class ModalViewController: UIViewController {
    
    var delegate:sendingInformation? = nil

    @IBAction func sendData(sender: AnyObject) {
        if (delegate != nil){
            delegate?.sendString("Hello World")
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

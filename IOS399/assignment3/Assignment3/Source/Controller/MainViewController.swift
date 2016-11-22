//
//  NavigationController.swift
//  Assignment3
//
//  Created by Zhexin Jia on 7/16/16.
//  Copyright © 2016 CIS 410. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, sendingInformation {
    
    let checkString = "Hello World"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func sendString(info: String) {
        if checkString == info{
            print("received String \(info) from Modal View")
        }else{
            print("Did not get String from Modal View")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "senderSegue"{
            let modalViewController: ModalViewController = segue.destinationViewController as! ModalViewController
            modalViewController.delegate = self
        }
            
    }
}

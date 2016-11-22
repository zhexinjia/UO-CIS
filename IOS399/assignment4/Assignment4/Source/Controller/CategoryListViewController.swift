//
//  CategoryListViewController.swift
//  Assignment4
//
//  Created by Zhexin Jia on 7/24/16.
//
//

import UIKit


class CategoryListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var catViewTable: UITableView!
    let frc = CatService.sharedCatService.catCategories()
    var catInfo:Category? = nil

    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        self.view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            try frc.performFetch()
        }catch{
            print("viwDidLoad frc perform error")
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CategoryListViewController.keyboardWillAppear(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CategoryListViewController.keyboardWillDisappear(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillAppear(notification:NSNotification){
        catViewTable.adjustInsetsForWillShowKeyboardNotification(notification)
    }
    
    func keyboardWillDisappear(notification:NSNotification){
        catViewTable.adjustInsetsForWillHideKeyboardNotification(notification)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let sections = frc.sections{
            return sections.count
        }
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //let frc = CatService.sharedCatService.catCategories()
        if let sections = frc.sections{
            let currentSection = sections[section]
            return currentSection.numberOfObjects
        }
        //return (frc.sections?[0].numberOfObjects)!
        return 0
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //let catInfo = CatService.sharedCatService.catCategories()[indexPath.row]
        catInfo = frc.objectAtIndexPath(indexPath) as? Category
        
        let cell = tableView.dequeueReusableCellWithIdentifier("catCell", forIndexPath: indexPath)
        cell.textLabel?.text = catInfo!.catName
        cell.detailTextLabel?.text = catInfo!.subTitle
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "senderSegue"{
            let catImageViewController: CatImageViewController = segue.destinationViewController as! CatImageViewController
            
            //catImageViewController.topass = catViewTable.indexPathForSelectedRow?.row
            catImageViewController.topass = frc.objectAtIndexPath((catViewTable.indexPathForSelectedRow)!) as? Category
        }
    }
    
    
    
}

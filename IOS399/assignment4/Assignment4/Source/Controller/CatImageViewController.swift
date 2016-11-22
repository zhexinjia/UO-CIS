//
//  CatImageViewController.swift
//  Assignment4
//
//  Created by Zhexin Jia on 7/25/16.
//
//

import UIKit
import CoreDataService
import CoreData

class CatImageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var collectionView: UICollectionView!
    var frc: NSFetchedResultsController? = nil
    var topass:Category?
    
    var images: Array<UIImage> = []
    //var imageArray: Array<String>? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        frc = CatService.sharedCatService.imageNamesForCategory(topass!)
        do{
            try frc!.performFetch()
        }catch{
            print("viwDidLoad frc perform error")
        }
        let result = frc?.fetchedObjects
        
        if let array = result{
            for item in array as! [Image]{
                images.append(UIImage(named:item.imageName!)!)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (images.count)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("imageCell", forIndexPath: indexPath) as! CollectionViewCell
        cell.imageView.image = images[indexPath.row]
        return cell
    }
    
 
}

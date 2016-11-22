//
//  CatService.swift
//  Assignment4
//
//  Created by Charles Augustine on 7/9/15.
//
//

import CoreData
import Foundation
import CoreDataService


class CatService {
    
    private let catData: Array<Dictionary<String, AnyObject>>
    static let sharedCatService = CatService()
    
    private init() {
        //get info from plist
        let catDataPath = NSBundle.mainBundle().pathForResource("CatData", ofType: "plist")!
        catData = NSArray(contentsOfFile: catDataPath) as! Array<Dictionary<String, AnyObject>>
        
        //store info to core data
        let coreDataService = CoreDataService.sharedCoreDataService
        
        let fetchRequest1 = NSFetchRequest(entityName: "Category")
        let count = coreDataService.mainQueueContext.countForFetchRequest(fetchRequest1, error: nil)
        guard count != NSNotFound else{
            fatalError("Cound not count Category in database")
        }
        
        if count == 0{
            var index = 0
            for item in catData{
                let imageNames: Array<String> = item["ImageNames"] as! Array<String>
                let entity = NSEntityDescription.insertNewObjectForEntityForName("Category", inManagedObjectContext: coreDataService.mainQueueContext) as! Category
                entity.catName = item["CategoryTitle"] as? String
                entity.subTitle = "Contains \(imageNames.count) images"
                
                
                var imageIndex = 0
                
                
                for image in imageNames{
                    let entity2 = NSEntityDescription.insertNewObjectForEntityForName("Image", inManagedObjectContext: coreDataService.mainQueueContext) as! Image
                    entity2.imageName = image
                    entity2.orderIndex = imageIndex
                    
                    //the image below is the relationship between 2 entity
                    entity2.image = entity
                    imageIndex += 1
                }
                index += 1
            }
            
            try! coreDataService.mainQueueContext.save()
            coreDataService.saveRootContext({
                //Intentionally left blank
            })
        }
    
    }
    
    func catCategories() -> NSFetchedResultsController {
        let coreDataService = CoreDataService.sharedCoreDataService
        
        let fetchRequest = NSFetchRequest(entityName: "Category")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "catName", ascending: true)]
        let context = coreDataService.mainQueueContext
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        return frc
        
    }
    
    func imageNamesForCategory(index: Category) -> NSFetchedResultsController {
        let coreDataService = CoreDataService.sharedCoreDataService
        let fetchRequest = NSFetchRequest(entityName: "Image")
        
        let Predicate = NSPredicate(format: "image.catName = %@", index.catName!)
        fetchRequest.predicate = Predicate
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "orderIndex", ascending: true)]
        let context = coreDataService.mainQueueContext
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        return frc
    }
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    /**
     below are the part1 code
    
	// MARK: Service
	func catCategories() -> Array<(title: String, subtitle: String)> {
		
        var myArray: Array<(title: String, subtitle: String)> = []
        
        for item in catData{
            let name = item["CategoryTitle"] as! String
            let imageNames = (item["ImageNames"] as! NSArray) as! Array<String>
            let subtitle = "Contains \(imageNames.count) images"
            let tuple:(title:String, subtitle:String) = (name, subtitle)
                myArray.append(tuple)
        }
            
        
        
        
        if (myArray.count == 0){
            fatalError("catCategories() not implemented")
        }else{
            return myArray
        }
        //fatalError("catCategories() not implemented")
	}

	func imageNamesForCategoryAtIndex(index: NSInteger) -> Array<String> {
        let imageNames: Array<String>? = catData[index]["ImageNames"] as? Array<String>
        
        if let array = imageNames{
            return array
        }else{
            fatalError("imageNamesForCategoryAtIndex(_:) not implemented")
        }
		//fatalError("imageNamesForCategoryAtIndex(_:) not implemented")
	}

	// MARK: Initialization
	private init() {
		let catDataPath = NSBundle.mainBundle().pathForResource("CatData", ofType: "plist")!
		catData = NSArray(contentsOfFile: catDataPath) as! Array<Dictionary<String, AnyObject>>
	}

	// MARK: Properties (Private)
	private let catData: Array<Dictionary<String, AnyObject>>

	// MARK: Properties (Static)
	static let sharedCatService = CatService()
    **/
 
}
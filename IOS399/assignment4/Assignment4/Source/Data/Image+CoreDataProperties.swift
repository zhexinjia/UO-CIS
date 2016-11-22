//
//  Image+CoreDataProperties.swift
//  Assignment4
//
//  Created by Zhexin Jia on 7/26/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Image {

    @NSManaged var imageName: String?
    @NSManaged var orderIndex: NSNumber?
    @NSManaged var image: Category?

}

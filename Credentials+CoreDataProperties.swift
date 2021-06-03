//
//  Credentials+CoreDataProperties.swift
//  JMarriner Project 1
//
//  Created by admin on 4/22/21.
//

import Foundation
import CoreData


extension Credentials
{
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Credentials>
    {
        return NSFetchRequest<Credentials>(entityName: "Credentials")
    }
    
    @NSManaged public var userN: String?
    @NSManaged public var passW: String?
    @NSManaged public var secQ: String?
    @NSManaged public var secAnsw: String?
    
}

extension Credentials : Identifiable
{
    
}

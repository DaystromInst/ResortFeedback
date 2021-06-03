//
//  SurvRes+CoreDataProperties.swift
//  JMarriner Project 1
//
//  Created by admin on 5/3/21.
//

import Foundation
import CoreData

extension SurvRes
{
    @nonobjc public class func fetchRequest() -> NSFetchRequest<SurvRes>
    {
        return NSFetchRequest<SurvRes>(entityName: "SurvRes")
    }

    @NSManaged public var userName: String

    @NSManaged public var rmQ1: Int
    @NSManaged public var rmQ2: Int
    @NSManaged public var rmQ3: String?

    @NSManaged public var gymQ1: Int
    @NSManaged public var gymQ2: Int
    @NSManaged public var gymQ3: String?

    @NSManaged public var fdQ1: Int
    @NSManaged public var fdQ2: Int
    @NSManaged public var fdQ3: String?

}

extension SurvRes : Identifiable
{
    
}

//
//  Singer+CoreDataProperties.swift
//  CoreDataProject 3
//
//  Created by Kristoffer Eriksson on 2021-03-29.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    
    var wrappedFirstName: String {
        return firstName ?? "unknown"
    }
    
    var wrappedLastName: String {
        return lastName ?? "unknown"
    }

}

extension Singer : Identifiable {

}

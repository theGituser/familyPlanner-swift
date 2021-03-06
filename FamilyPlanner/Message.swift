//
//  Message.swift
//  FamilyPlanner
//
//  Created by Julia Will on 11.01.16.
//  Copyright © 2016 Julia Will. All rights reserved.
//

import CoreData

class Message: NSManagedObject {
    @NSManaged var remoteID: NSNumber?
    @NSManaged var message : String
    @NSManaged var synced : Bool
    @NSManaged var subject : String?
    @NSManaged var read : Bool
    @NSManaged var createdAt: NSDate?
    @NSManaged var updatedAt: NSDate?
    @NSManaged var author: String
    
    @NSManaged var group : Group
    @NSManaged var parent : Message?
    @NSManaged var messages : [Message]?
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(properties: NSDictionary, group : Group, context: NSManagedObjectContext) {
        
        //Core Data
        let entity = NSEntityDescription.entityForName("Message", inManagedObjectContext: context)!
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        if properties["id"] != nil {
            remoteID = NSNumber(integer: properties["id"] as! Int)
        }
        self.group = group
        self.message = properties["message"] as! String
        self.subject = properties["subject"] as! String?
        self.synced = Bool(false)
        self.read = false
        self.author = properties["author"] as! String
        //TODO: handle parent / child
    }
    
    func metaInfoText() -> String {
        
        var str = "\(author) wrote"
        if createdAt != nil {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "MM/dd/yyyy HH:mm"
            str = str + " at \(formatter.stringFromDate(createdAt!))"
        }
        str = str + ":"
        return str
    }
}
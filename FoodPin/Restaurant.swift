//
//  Restaurant.swift
//  FoodPin
//
//  Created by GuoTianqi on 15/7/1.
//  Copyright (c) 2015年 GuoTianqi. All rights reserved.
//

import Foundation
import CoreData

class Restaurant : NSManagedObject {
    @NSManaged var name: String!
    @NSManaged var type: String!
    @NSManaged var location: String!
    @NSManaged var image: NSData!
    @NSManaged var isVisited: NSNumber!
}
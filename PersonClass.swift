//
//  PersonClass.swift
//  QuickRide
//
//  Created by Alex Lao on 3/5/17.
//  Copyright © 2017 Alex Lao. All rights reserved.
//

import Foundation
class Person{
    var Name: String?
    var cellNumber: String?
    var location: String?
    
    init(name: String, cellNumber: String, location:String){
        self.Name = name
        self.cellNumber = cellNumber
        self.location = location
        
    }
    func changeLocation(loc: String){
        self.location = loc
    }
}
//
//  Queue.swift
//  QuickRide
//
//  Created by Alex Lao on 3/5/17.
//  Copyright © 2017 Alex Lao. All rights reserved.
//

import Foundation
class Queue{
    
    private var first: Node?
    private var last: Node?
    private var size: Int?
    
    init(){
        first = nil
        last = nil
        size = 0
    }
    
    func add(person: Person?){
        var newRider = Node(user: person!)
        if(size == 0){
            first = newRider
            last = newRider
        }
        else{
            newRider.prev = last
            last!.next = newRider
            last = newRider
        }
        size = size! + 1
    }
    func remove() -> Person{
        if(size == 0){
            return Person(name: "No Requests", cellNumber: " ", location: " ")
        }
        var toDrive = first!.rider
        if(size == 1){
            first = nil
            last = nil
        }
        else{
            first = first!.next
            first!.prev = nil
        }
        size = size! - 1;
        return toDrive!
    }
    
    func length()->Int{
        return size!
    }
    
    private class Node{
        var rider: Person?
        var next: Node?
        var prev: Node?
        
        init(user: Person){
            self.rider = user
            next = nil
            prev = nil
        }
        
    }
    
}
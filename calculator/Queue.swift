//
//  Queue.swift
//  calculator
//
//  Created by Anastasia on 25/03/2018.
//  Copyright © 2018 Anastasia. All rights reserved.
//

import Foundation

class Queue{
    
    
    var items: [Value]
    
    init() {
        items = []
    }
    
    func push(_ item: Double) {
        let a = Value(date:item, type: Type.value)
        //   a.date = item.date
        items.append(a)
    }
    
    func pushchar(_ item:Double) {
        let a = Value(date:item, type: Type.operation)
        //   a.date = item.date
        items.append(a)
    }
    
    func isEmpty() -> Bool{
        return items.isEmpty
    }
    
    func pop()-> Value{
        let a: Value = items.first!
        self.items.removeFirst()
        return a
    }
    
    func show(){
        for item in items{
            print(item.date, item.type)
        }
    }
    
    func copy( a:Queue )-> Queue{
        let newq: Queue = Queue()
        for b in a.items{
            if b.type==Type.value {
                newq.push(b.date)
            }
            else{
                newq.pushchar(b.date)
            }
            
        }
        return newq
    }
    
    
}

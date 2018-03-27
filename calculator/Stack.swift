//
//  Stack.swift
//  calculator
//
//  Created by Anastasia on 25/03/2018.
//  Copyright © 2018 Anastasia. All rights reserved.
//

import Foundation

 // var mystack : Stack = Stack()

enum Type{
    case value
    case operation
}

struct Value{
    var date=0.0
    var type : Type
}

class Stack{
    
    var items: [Value]
    
    init() {
        items = []
    }
    
    func push(_ item: Value) {
        items.append(item)
    }
    
    func pop() -> Value {
        // if self.isEmpty()==false {
        let a:Value = items.popLast()!
        return a
        //  }
    }
    
    func get()-> Value {
        var a: Value
        a = items.popLast()!
        self.push(a)
        return a
    }
    
    func isEmpty() -> Bool{
        return items.isEmpty
    }
    
    func show(){
        for item in items{
            print(item.date, item.type)
        }
    }
    
}

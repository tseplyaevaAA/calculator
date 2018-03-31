//
//  mainFunc.swift
//  calculator
//
//  Created by Anastasia on 31/03/2018.
//  Copyright © 2018 Anastasia. All rights reserved.
//

import Foundation

func mainFunc(a: String)-> String {
    
    var numbers = [String]()
    var final : Double = 0.0
    var answer: String = ""
    
    numbers = turnToStrings(a: a)
    
    if check(a: numbers) == 0 {
        var myque : Queue = Queue()
        myque = turnToQueue(a: numbers)
        
        // need to reverse queue
        var myque2 : Queue = Queue()
        myque2 = myque.reverseQueue(a: myque)
        
        let  result: Queue =  reversePN(a: myque2)
        let result1 : Queue = Queue()
        // result.show()
        
        let calc : Stack = Stack()
        
        while  result.isEmpty() == false {
            let elem = result.pop()
            calc.push(elem)
            if IfValue(a: elem) == 1 {
                result1.push(elem.date)
            }else{
                result1.pushchar(elem.date)
            }
            
        }
        
        //calc.show()
        var calc1 : Stack = Stack()
        
        calc1 = calc.reverseStack()
        //print("      ")
        // calc 1 is to calculate
        //  calc1.show()
        
        final  = countStack(a: calc1)
        answer = String(final)
        
    }else{
        answer = "error"
    }
    return answer
}

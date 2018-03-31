//
//  Counter.swift
//  calculator
//
//  Created by Anastasia on 25/03/2018.
//  Copyright © 2018 Anastasia. All rights reserved.
//

import Foundation

func IfValue(a:Value) -> Int {
    if a.type == Type.value {
        return 1}
    else{
        return 0
    }
}
// check correctness
func check (a: [String])-> Int {
    var k = 0
    var i1 = 0
    var i2 = 0
    for i in  0...a.count-1 {
        if a[i] == "(" { i1 += 1  }
        if a[i] == ")" { i2 += 1  }
    }
    if i1 != i2 { k += 1 }
    
    var i3 = 0
    if a.count > 1 {
    for i in 1...a.count-1 {
        if a[i] == a[i-1] && (a[i] == "+" || a[i] == "-" || a[i] == "*"||a[i] == "/" ) {
            i3 += 1
        }
    }
    if i3 > 0 { k += 1 }
    }
    
    var i4 = 0
    for i in 0...a.count-1 {
        if (a[i] == "+" || a[i] == "-" || a[i] == "*"||a[i] == "/" ) {
            i4 += 1
        }
    }
    if i4 == 0 { k += 1 }
    
    return k
}



//turns an input string into arrays of values and signes
func turnToStrings(a: String) ->  [String] {    let loc = a
    var newloc =  loc.replacingOccurrences(of: " ", with: "")
    var needloc = ""
    var numbers = [String]()
    
    //add a " " after signes
    for i in 0...newloc.characters.count-1 {
        if ( String(newloc[newloc.index(newloc.startIndex, offsetBy: i)]) == "(" || String(newloc[newloc.index(newloc.startIndex, offsetBy: i)]) == ")" || String(newloc[newloc.index(newloc.startIndex, offsetBy: i)]) == "+" || String(newloc[newloc.index(newloc.startIndex, offsetBy: i)]) == "-" || String(newloc[newloc.index(newloc.startIndex, offsetBy: i)]) == "/" || String(newloc[newloc.index(newloc.startIndex, offsetBy: i)]) == "*" ) {
            needloc += String(newloc[newloc.index(newloc.startIndex, offsetBy: i)])
            needloc += " "
        }else{
            needloc += String(newloc[newloc.index(newloc.startIndex, offsetBy: i)])
        }
    }

    //add a " " before signes
    var finalstr = ""
    for i in 0...needloc.characters.count-1 {
        if ( String(needloc[needloc.index(needloc.startIndex, offsetBy: i)]) == "(" ||
            String(needloc[needloc.index(needloc.startIndex, offsetBy: i)]) == ")" ||
            String(needloc[needloc.index(needloc.startIndex, offsetBy: i)]) == "+" ||
            String(needloc[needloc.index(needloc.startIndex, offsetBy: i)]) == "-" ||
            String(needloc[needloc.index(needloc.startIndex, offsetBy: i)]) == "/" ||
            String(needloc[needloc.index(needloc.startIndex, offsetBy: i)]) == "*" ) {
            
            if i != 0 && (String(needloc[needloc.index(needloc.startIndex, offsetBy: i-1)]) != " " ) {
                finalstr += " "
                finalstr += String(needloc[needloc.index(needloc.startIndex, offsetBy: i)])
            }else{
                finalstr += String(needloc[needloc.index(needloc.startIndex, offsetBy: i)])
            }
        }else{
            finalstr += String(needloc[needloc.index(needloc.startIndex, offsetBy: i)])
        }
    }

    
    // nubmers - array of values and signes
    numbers = finalstr.components(separatedBy: [" "])
    
    //delete "" from numbers
    for i in 0...numbers.count-1 {
        if numbers[i] == "" {
            numbers.remove(at:i)
        }
    }
    return numbers
}

//turns array to queue of structures
func turnToQueue(a: [String])-> Queue {
    let b : Queue = Queue()
    
    for i in 0...a.count-1 {
        switch (a[i]){
        case "+": b.pushchar(43)
        case "-": b.pushchar(45)
        case "/": b.pushchar(47)
        case "*": b.pushchar(42)
        case "(": b.pushchar(40)
        case ")": b.pushchar(41)
        default: b.push(Double(a[i])!)
        }
    }
    return b
}


// reverse polish notation
func reversePN(a: Queue)-> Queue {
    let result : Queue = Queue()
    let abc : Stack = Stack()
    var sl = a.items.count
    for _ in 0...a.items.count-1 {
        
        let elem: Value = a.pop()
        let c = elem.date
        
        if  IfValue(a: elem) == 1 {
            result.push(c)
        }
        else{
            if c == 41 {
                while abc.isEmpty() == false && abc.get().date != 40 {
                    let p1 = abc.pop()
                    if p1.date !=  40 && p1.date != 41  {
                        result.pushchar(p1.date)
                    }
                }
                
            }
            var prior: Int = 0
            var prior1 : Int = 0
            
            switch (c){
            case 40,41 : prior = 0 // ( )
            case 42,47 : prior = 2 // * /
            case 43,45 : prior = 1 // + -
            default: ()
            }
            
            if abc.isEmpty() == false {
                let versh = abc.get()
                let c1 = versh.date
                
                switch (c1){
                case 40,41 : prior1 = 0
                case 42,47 : prior1 = 2  //* /
                case 43,45 : prior1 = 1 // + -
                default : ()
                }
                
                
                let deltop : Value
                if prior < prior1 {
                    if c1 != 40 && c1 != 41 {
                        deltop = abc.pop()
                        result.pushchar(c1)
                        abc.push(elem)
                        
                    }else{
                        sl = sl-1
                    }
                    
                }else {
                    abc.push(elem)
                }
            }else{
                abc.push(elem)
            }
        }
    }
    
    while abc.isEmpty() == false {
        let  p1 = abc.pop()
        if p1.date != 40 && p1.date != 41 {
            result.pushchar(p1.date)
        }
    }
    
    
    return result
    //result.show()
}


// final counting stack
func countStack(a: Stack)-> Double{
    var a1 : Value
    var a2 : Value
    var a3 : Value
    
    var res = Value(date: 0.0, type: Type.value)
    
    while a.isEmpty() != true {
        a1 = a.pop()
        if a.isEmpty() != true {
            a2 = a.pop()
            if a.isEmpty() != true {
                
                a3 = a.pop()
                
                switch (a3.date) {
                case 42: res.date = a1.date*a2.date
                case 43: res.date = a1.date+a2.date
                case 45: res.date = a1.date-a2.date
                case 47: if a1.date != 0 {
                    res.date = a1.date/a2.date
                }else{
                  ()
                    }
                default: ()
                }
                a.push(res)
            }
            
        }else{
            res.date = a1.date
        }
    }
    return res.date
}







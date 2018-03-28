//
//  functions.swift
//  calculator
//
//  Created by Anastasia on 28/03/2018.
//  Copyright © 2018 Anastasia. All rights reserved.
//

import Foundation

var a : String   = " (2.3  +3 )*12  -10 "

//turns an input string into arrays of values and signes
func turnToArray(a: String) {
    
    let loc = a
    var newloc =  loc.replacingOccurrences(of: " ", with: "")
    var needloc = ""
    //add a " " after signes
    for i in 0...newloc.characters.count-1 {
        if ( String(newloc[newloc.index(newloc.startIndex, offsetBy: i)]) == "(" || String(newloc[newloc.index(newloc.startIndex, offsetBy: i)]) == ")" || String(newloc[newloc.index(newloc.startIndex, offsetBy: i)]) == "+" || String(newloc[newloc.index(newloc.startIndex, offsetBy: i)]) == "-" || String(newloc[newloc.index(newloc.startIndex, offsetBy: i)]) == "/" || String(newloc[newloc.index(newloc.startIndex, offsetBy: i)]) == "*" ) {
            needloc += String(newloc[newloc.index(newloc.startIndex, offsetBy: i)])
            needloc += " "
        }else{
            needloc += String(newloc[newloc.index(newloc.startIndex, offsetBy: i)])
        }
    }
    
    //  print(needloc)
    
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
    
    //print(finalstr) // is good to be cut into array[i]
    
    // nubmers - array of values and signes
    var numbers = finalstr.components(separatedBy: [" "])
    //   print(numbers)
    
    //delete "" from numbers
    for i in 0...numbers.count-1 {
        if numbers[i] == "" {
            numbers.remove(at:i)
        }
    }
    //print(numbers)
}



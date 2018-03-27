//
//  ViewController.swift
//  calculator
//
//  Created by Anastasia on 25/03/2018.
//  Copyright © 2018 Anastasia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func pressSeven(_ sender: UIButton) {
        textField.text? += "7"
    }
    
    @IBAction func pressEight(_ sender: UIButton) {
        textField.text? += "8"
    }
    
    
    @IBAction func pressNine(_ sender: UIButton) {
        textField.text? += "9"
    }
    
    
    @IBAction func pressFour(_ sender: UIButton) {
         textField.text? += "4"
    }
    
    @IBAction func pressFive(_ sender: UIButton) {
        textField.text? += "5"
    }
    
    
    @IBAction func pressSix(_ sender: UIButton) {
        textField.text? += "6"
    }
    
    @IBAction func pressOne(_ sender: UIButton) {
        textField.text? += "1"
    }
    
    
    @IBAction func pressTwo(_ sender: UIButton) {
        textField.text? += "2"
    }
    
    @IBAction func pressThree(_ sender: UIButton) {
        textField.text? += "3"
    }
    
    @IBAction func pressZero(_ sender: UIButton) {
        textField.text? += "0"
    }
    
    
    @IBAction func pressPoint(_ sender: UIButton) {
        textField.text? += "."
    }
    
    
    @IBAction func pressMul(_ sender: UIButton) {
        textField.text? += "*"
    }
    
    @IBAction func pressDiv(_ sender: UIButton) {
        textField.text? += "/"
    }
    
    
    @IBAction func pressAdd(_ sender: UIButton) {
        textField.text? += "+"
    }
    
    
    @IBAction func pressEr(_ sender: UIButton) {
         textField.text? += "-"
    }
    
    @IBAction func pressL(_ sender: UIButton) {
        textField.text? += "("
    }
    
    
    @IBAction func pressR(_ sender: UIButton) {
        textField.text? += ")"
    }
    
    @IBAction func deleteLast(_ sender: UIButton) {
      //  var str :String = ""
      var str = (textField.text)!
      if textField.text != "" {
            str.remove(at: str.index(before: str.endIndex))
            textField.text = str
        }
        
    }
    
    
}


//
//  ViewController.swift
//  calculator
//
//  Created by Anastasia on 25/03/2018.
//  Copyright © 2018 Anastasia. All rights reserved.
///Users/anastasia/Desktop/calculator/calculator/Counter.swift

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


   
    @IBAction func addNumeral(_ sender: UIButton) {

      textField.text? += sender.currentTitle!
    }
    
    
    @IBAction func delAll(_ sender: UIButton) {
        textField.text? = ""
        answerLabel.text? = ""
    }
    
    @IBAction func count(_ sender: UIButton) {
        let action = Functionality()
        let a: String = textField.text!
        var str = ""
        str = action.mainFunc(a: a)
        if str == "error" {
            
       let alert = UIAlertController(title: "Error", message: "Incorrect arithmetic expression", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler:nil))
        present(alert, animated: true, completion: {
                
        })
        textField.text = ""
        answerLabel.text = ""
        }else{
        answerLabel.text = str
        }
    }
    
   
    
    @IBAction func deleteLast(_ sender: UIButton) {
      var str = (textField.text)!
      if textField.text != "" {
            str.remove(at: str.index(before: str.endIndex))
            textField.text = str
        }
     }
    
    
}


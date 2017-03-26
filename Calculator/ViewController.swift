//
//  ViewController.swift
//  Calculator
//
//  Created by Manoj  Muthireddy on 3/20/17.
//  Copyright © 2017 Manoj  Muthireddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet private var Display: UILabel!
    private var userIsInTheMiddleOfTyping = false
    
    
    @IBAction private func touchDigit(_ sender: UIButton)  {
        let digit = sender.currentTitle!
        
        if(userIsInTheMiddleOfTyping){
        
            let textCurrentlyInDisplay = Display.text!
            Display.text = textCurrentlyInDisplay + digit
        } else {
            Display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    private var displayValue : Double {
        get {
            return Double(Display.text!)!
            
        }
        set {
             Display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func Perform(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if  let mathSymbol = sender.currentTitle{
            
            brain.performOperation(symbol: mathSymbol)
        }
        displayValue = brain.result
        
    

}
}

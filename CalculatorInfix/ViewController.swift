//
//  ViewController.swift
//  CalculatorInfix
//
//  Created by Bruce Wang on 3/14/15.
//  Copyright (c) 2015 Bruce Wang. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var string1:String = "";
    
    var brain = CalculatorBrainInfix()
    @IBOutlet weak var display: UILabel!


    @IBAction func appendElement(sender: UIButton) {
        let element = sender.currentTitle!
        //println("\(element)")
        if (brain.string3 == string1 && element >= "0" && element <= "9")
        {
            string1 = ""
            string1.append(Array(element)[0])
        }
        else
        {
            string1.append(Array(element)[0])
        }
        display.text = string1
        println("\(string1)")
    }
    
    @IBAction func getTheResult(sender: UIButton) {
        brain.assort(string1)
        display.text = brain.string3
        string1 = "\(brain.string3)"
        brain.string2 = ""
        brain.operation.removeAll()
    }
    
    @IBAction func clear(sender: UIButton) {
        string1 = ""
        brain.string2 = ""
        display.text = "0"
        brain.operation.removeAll()
    }
    
    @IBAction func postfixExpression(sender: UIButton) {
        brain.assort(string1)
        display.text = "\(brain.string2)"
    }
}


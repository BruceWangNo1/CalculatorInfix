//
//  CalculatorBrainInfix.swift
//  CalculatorInfix
//
//  Created by Bruce Wang on 3/14/15.
//  Copyright (c) 2015 Bruce Wang. All rights reserved.
//

import Foundation

class CalculatorBrainInfix
{
    var m:Int = 0
    var j:Int = 0
    var string2:String = ""
    var postfixExpression: String = ""
    var opStack = Array<Character>()
    var spaceBar: Character = " "
    var minusSign: Character = "-"
    var operation = [Character]()
    var i:Int = 0
    var string3:String = ""
    func assort(string1: String)
    {
        var i:Int
        var a:Character
        i = 0
        j = 0
        
        m = count(string1)
        for (i = 0; i < m; i++)
        {
            a = Array(string1)[i]
            if (i == 0 && Array(string1)[0] == "-" && Array(string1)[1] >= "0" && Array(string1)[1] <= "9")
            {
                string2.append(minusSign)
            }
            else if (Array(string1)[i] >= "0" && Array(string1)[i] <= "9" || Array(string1)[i] == ".")
            {
                string2.append(Array(string1)[i])
                //string2.append(spaceBar)
            }
            else
            {
                switch (a)
                {
                case "(": operation.append(a)
                case "÷", "×":
                    string2.append(spaceBar)
                    if (!operation.isEmpty&&(operation.last == "*" || operation.last == "/"))
                    {
                        string2.append(operation.removeLast())
                        string2.append(spaceBar)
                    }
                    operation.append(a)
                case "+", "-":
                    string2.append(spaceBar)
                    if (!operation.isEmpty&&(operation.last == "+" || operation.last == "-" || operation.last == "×" || operation.last == "÷"))
                    {
                        string2.append(operation.removeLast())
                        string2.append(spaceBar)
                        if (!operation.isEmpty&&(operation.last == "+"||operation.last == "-"))
                        {
                            string2.append(operation.removeLast())
                            string2.append(spaceBar)
                        }
                    }
                    operation.append(a)
                case ")":
                    string2.append(spaceBar)
                    while (operation.last != "(")
                    {
                        string2.append(operation.removeLast())
                        string2.append(spaceBar)
                    }
                    operation.removeLast()
                default:
                    println("Wrong Input. Please try again.\n")
                    operation.removeAll()
                    string2.removeAll()
                }
            }
        }
        while (!isEmpty(operation))
        {
            string2.append(spaceBar)
            string2.append(operation.removeLast())
        }
        println("The postfix expression is \(string2)")
        calculate()
    }
    func calculate() ->Int
    {
        var a:Float
        var n:Int
        var p = Array<Float>()
        var y:Float = 0
        var x:Float = 0
        j = count(string2)
        println("number of elements \(j)")
        for (i = 0; i < j; i++)
        {
            if (i == 0 && Array(string2)[0] == "-" &&  Array(string2)[1] >= "0" && Array(string2)[1] <= "9")
            {
                println("fine")
                a = (string2.substringFromIndex(advance(string2.startIndex, 1)) as NSString).floatValue
                println("\(a)")
                for (n = 1; Array(string2)[n] >= "0" && Array(string2)[n] <= "9" || Array(string2)[n] == "."; n++)
                {
                    
                }
                a = 0 - a
                p.append(a)
                i = n
            }
            else if (Array(string2)[i] >= "0" && Array(string2)[i] <= "9")
            {
                a = (string2.substringFromIndex(advance(string2.startIndex, i)) as NSString).floatValue
                println("\(a)")
                for (n = i; Array(string2)[n] >= "0" && Array(string2)[n] <= "9" || Array(string2)[n] == "."; n++)
                {
                    
                }
                p.append(a)
                i = n - 1
            }
            else
            {
                if (Array(string2)[i] == "#")
                {
                    println("Evaluation Result is \(p)\n")
                }
                else
                {
                    if (Array(string2)[i] == spaceBar)
                    {
                        
                    }
                    else
                    {
                        if p.count < 2
                        {
                            string2 = ""
                            string3 = "0"
                            return 0
                        }
                        else
                        {
                            y = p.removeLast()
                            x = p.removeLast()
                        }
                        
                        println("\(x) \(y)")
                        switch (Array(string2)[i])
                        {
                            case "+":
                                a = x + y
                                p.append(a)
                            case "-":
                                a = x - y
                                p.append(a)
                            case "×":
                                a = x * y
                                p.append(a)
                            case "÷":
                                if (y == 0)
                                {
                                    println("Zero cannnot divide!\n")
                                }
                                else
                                {
                                    a = x / y
                                    p.append(a)
                                }
                            default:
                                println("Error in operations")
                        }
                    }
                }
            }
            
        }
        string3 = NSString(format: "%.2f", Array(p)[0]) as String
        return 0;
    }
}
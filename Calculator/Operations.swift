//
//  Operations.swift
//  Calculator
//
//  Created by Mehmet Fatih Güleryüz on 4.07.2022.
//

import Foundation

func addition(a: Double, b: Double) -> Double {
    return a + b
}
 
func subtraction(a: Double, b: Double) -> Double {
    return a - b
}
 
func multiply(a: Double, b: Double) -> Double {
    return a * b
}
 
func division(a: Double, b: Double) -> Double {
    return a / b
}

func percentage(a: Double, b:Double) -> Double {
    return a / b
}
 
func calculate(a: Double, b: Double, operation: (Double, Double) -> Double) -> Double{
    let result = operation(a, b)
    return result
}

func operationParser(operation : String, a:Double, b:Double)-> Double{
    var op = addition;
    var secondOperand = b;
    switch operation{
        case "+":
            op = addition
            break;
        case "-":
            op = subtraction
            break;
        case "x":
            op = multiply
            break;
        case "÷":
            op = division
            break;
        case "%":
            op = percentage
            secondOperand = 100
            break;
        default:
            print("wrong operation")
            return -1
    }
    return calculate(a: a, b: secondOperand, operation: op);
}

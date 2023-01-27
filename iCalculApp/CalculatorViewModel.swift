//
//  CalculatorViewModel.swift
//  iCalculApp
//
//  Created by Sha'Marcus Walker on 1/18/23.
//

import Foundation

struct CalculatorViewModel {
    
    enum Operator {
        case division
        case multiplication
        case addition
        case subtraction
    }
    
    private var storedOperator: Operator?
    private var storedText: String?
    var text = "0"
    
    init() {
        
    }
    
//    mutating func applyStoredOperator(){
//        if let _operator = storedOperator, let _storedText = storedText {
//            let number1 = Double(_storedText) ?? 0.0
//            let number2 = Double(text) ?? 0.0
//
//            switch _operator {
//            case .division:
//                if abs(number2) < 0.0000001 {
//                    text = "illegal"
//                } else {
//                    let result = number1 / number2
//                    setText(double: result)
//                }
//            case .multiplication:
//                let result = number1 * number2
//                setText(double: result)
//
//            case .addition:
//                let result = number1 + number2
//                setText(double: result)
//
//            case .subtraction:
//                let result = number1 - number2
//                setText(double: result)
//
//            }
//
//        }
//    }
    
    mutating func appendOperator(_ inputOperator: Operator) {
        storedText = text
        storedOperator = inputOperator
    }
    
    mutating func appendNumber(_ number: String) {
        if text == "0"{
            text = number
        } else {
            text = text + number
        }
    }
    
    mutating func appendDecimal() {
        for letter in text {
            if letter == "." { return }
        }
        text += "."
    }
    
    mutating func clear() {
        text = "0"
    }
}

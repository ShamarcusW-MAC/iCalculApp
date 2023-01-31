//
//  CalculatorViewModel.swift
//  iCalculApp
//
//  Created by Sha'Marcus Walker on 1/31/23.
//

import Foundation

class CalculatorViewModel: ObservableObject {
    
    @Published var inputNumber = "0"
    @Published var runningNumber = 0.0
    @Published var currentOperator: Operator = .none
        
    let buttons: [[CalculatorButton]] = [
        [.clear, .posslashneg, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    func roundToHundredths(result: Double) -> Double {
        return (round(result * 100) / 100)
    }
    
    func buttonAction(calcButton: CalculatorButton) {
        switch calcButton {
            case .add, .subtract, .multiply, .divide, .equal:
                if calcButton == .add {
                    self.currentOperator = .addition
                    self.runningNumber = Double(self.inputNumber) ?? 0
                    
                } else if calcButton == .subtract {
                    self.currentOperator = .subtraction
                    self.runningNumber = Double(self.inputNumber) ?? 0

                } else if calcButton == .multiply {
                    self.currentOperator = .multiplication
                    self.runningNumber = Double(self.inputNumber) ?? 0

                } else if calcButton == .divide {
                    self.currentOperator = .division
                    self.runningNumber = Double(self.inputNumber) ?? 0
                } else if calcButton == .equal {
                    let runningValue = self.runningNumber
                    let currentValue = Double(self.inputNumber) ?? 0
                    switch self.currentOperator {
                    case .addition: self.inputNumber = "\(roundToHundredths(result: runningValue + currentValue))"
                    case .subtraction: self.inputNumber = "\(roundToHundredths(result: runningValue - currentValue))"
                    case .multiplication: self.inputNumber = "\(roundToHundredths(result: runningValue * currentValue))"
                    case .division: self.inputNumber = "\(roundToHundredths(result: runningValue / currentValue))"
                    case .none:
                        break
                    }

                }
            if calcButton != .equal {
                self.inputNumber = "0"
            }
        case .decimal, .percent, .posslashneg:
            if calcButton == .decimal{
                if (!self.inputNumber.contains(".")) {
                    self.inputNumber.append(".")
                }
            }
            if calcButton == .posslashneg {
                if self.inputNumber != "0" {
                    if (!self.inputNumber.contains("-")) {
                        self.inputNumber = "-" + self.inputNumber
                    } else {
                        self.inputNumber.removeFirst()
                    }
                }
                
            }
            
            if calcButton == .percent {
                self.inputNumber = "\((Double(self.inputNumber) ?? 0 ) * 0.01)"
                 
            }
                break
                
            case .clear:
                self.currentOperator = .none
                self.inputNumber = "0"
                self.runningNumber = 0
                break
                
            default:
            let number = calcButton.rawValue
            if self.inputNumber == "0" {
                self.inputNumber = number
            } else {
                self.inputNumber.append(number)
            }
            
                break
        }
    }
}

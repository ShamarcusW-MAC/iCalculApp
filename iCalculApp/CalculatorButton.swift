//
//  CalculatorButton.swift
//  iCalculApp
//
//  Created by Sha'Marcus Walker on 1/18/23.
//

import SwiftUI

enum CalculatorButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case multiply = "x"
    case divide = "/"
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case posslashneg = "+/-"
    case equal = "="
}

extension CalculatorButton {
    
    var color: Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return Color.orange
        case .clear, .posslashneg, .percent:
            return Color("DarkGray")
        default:
            return Color.gray
        }
    }
    
}

enum Operator {
    case division
    case multiplication
    case addition
    case subtraction
    case none
}

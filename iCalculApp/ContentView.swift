//
//  ContentView.swift
//  iCalculApp
//
//  Created by Sha'Marcus Walker on 1/17/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputNumber = "0"
    @State var runningNumber = 0.0
    @State var currentOperator: Operator = .none
        
    let buttons: [[CalculatorButton]] = [
        [.clear, .posslashneg, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        let inputFontSize = Device.isIpad ? 100 : 72
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(inputNumber)
                        .bold()
                        .font(.system(size: CGFloat(inputFontSize)))
                        .foregroundColor(Color("CalcBlue"))
                        .padding(.trailing)
                    
                }
                .padding()
                
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            
                            let buttonWidth = (item.rawValue != "0" ? UIScreen.main.bounds.width / 4.5 : (UIScreen.main.bounds.width / 4.5) * 2.1)
                                                        
                            let buttonHeight = Device.isIpad ? 150.0 : 100.0

                            Button {
                                buttonAction(calcButton: item)
                            } label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .foregroundColor(Color("CalcBlue"))
                                    .bold()
                                    .frame(width: buttonWidth, height: buttonHeight)
                                    .background(RoundedRectangle(cornerRadius:12)
                                        .foregroundColor(item.color))
                            }
                        }
                    }
                }
            }
        }
    }
    
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  iCalculApp
//
//  Created by Sha'Marcus Walker on 1/17/23.
//

import SwiftUI

struct CalculatorView: View {
    
    @ObservedObject var viewModel = CalculatorViewModel()
    
    var body: some View {
        let inputFontSize = Device.isIpad ? 100 : 72
        
        GeometryReader  { worldGeometry in
            
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text(viewModel.inputNumber)
                            .bold()
                            .font(.system(size: CGFloat(inputFontSize)))
                            .foregroundColor(Color("CalcBlue"))
                            .padding(.trailing)
                        
                    }
                    .padding()
                    
                    ForEach(viewModel.buttons, id: \.self) { row in
                        HStack(spacing: 12) {
                            ForEach(row, id: \.self) { item in
                                
                                let buttonWidth = (item.rawValue != "0" ? worldGeometry.size.width / 4.5 : (worldGeometry.size.width / 4.5) * 2.1)
                                
                                let buttonHeight = Device.isIpad ? worldGeometry.size.height / 8.5 : worldGeometry.size.height / 8.5
                                
                                Button {
                                    viewModel.buttonAction(calcButton: item)
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

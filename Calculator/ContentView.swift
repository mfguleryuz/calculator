//
//  ContentView.swift
//  Calculator
//
//  Created by Mehmet Fatih Güleryüz on 4.07.2022.
//
import SwiftUI

struct ContentView: View {
    @State private var displayNumber = "0.0"
    @State private var operand1 = 0.0
    @State private var operand2 = 0.0
    @State private var operation = ""
    @State private var transactionQuery = ""
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    TextField("", text: $displayNumber)
                        .font(.system(size: 70))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.white)
                        .frame(minWidth:0,maxWidth: .infinity,maxHeight: 150)
                        .padding(.horizontal,5)
                }
                HStack{
                    TextField("", text: $transactionQuery)
                        .font(.system(size: 30))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.white)
                        .frame(minWidth:0,maxWidth: .infinity,maxHeight: 150)
                        .padding(.horizontal,5)
                }

                VStack{
                    ForEach(buttonRows, id: \.self) { buttonRow in
                        HStack(alignment: .top, spacing: 0) {
                            Spacer(minLength: 13)
                            ForEach(buttonRow, id: \.self) { button in
                                ButtonsView(name: button)
                                    .onTapGesture {
                                        checkOperation(input: button)
                                    }
                            }
                        }
                    }
                        
                }
            }
        }
    }

    func checkOperation(input: String){
       
        switch input {
            case "AC":
                restart()
                break;
            case "+", "-","x","÷","%":
                operation = input
                transactionQuery += input;
                break;
            case "=":
                let result = operationParser(operation:operation, a:operand1, b:operand2)
                operand1 = result;
                operand2 = 0.0
                operation = ""
                displayNumber = String(result)
                break;
            default:
                let value = Double(input) ?? 0.0
            
                if(operation == ""){
                   operand1 = (operand1 * 10) + value
                }else{
                    operand2 = (operand2 * 10) + value
                }
            
                transactionQuery += input;
                break;
        }
    }

    func restart(){
        operand1 = 0.0
        operand2 = 0.0
        transactionQuery = ""
        displayNumber = "0.0";
        operation = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

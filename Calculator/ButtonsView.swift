//
//  ButtonsView.swift
//  Calculator
//
//  Created by Mehmet Fatih Güleryüz on 4.07.2022.
//
import SwiftUI

struct ButtonsView: View {
    var name:String
    var bgColor:Color{
        switch name {
        case "1","2","3","4","5","6","7","8","9","0",".":
            return Color(.systemGray2)
        case "%":
            return Color(.systemGray4)
        case "AC":
            return Color(.red)
        default:
            return .orange
        }
    }

    var foregroundColor:Color{
        switch name {
        case "AC","%":
            return .black
        default:
            return .white
        }
    }
    
    func width()->CGFloat{
        switch name {
        case "AC":
            return 160
        case "=":
            return 240
        default:
            return 80
        }
    }
    
    func height()->CGFloat{
        return 80
    }

    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .fill(bgColor)
            .frame(width: width(), height: height())
            .overlay(
            Text(name)
                .font(.largeTitle)
                .foregroundColor(foregroundColor)
            )
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView(name: "0")
    }
}

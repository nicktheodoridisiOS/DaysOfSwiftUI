//  Day11.swift
//  16/6/23
import SwiftUI

struct Day11: View {
    var body: some View {
        VStack{
            
            Spacer()
            HStack(spacing:0){
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.red)
                    .frame(width: 150 , height: 150)
                Spacer()
                    .frame(width: 20)
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.green)
                    .frame(width: 150 , height: 150)
            }
            .padding(.horizontal)
            HStack(spacing:0){
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .frame(width: 150 , height: 150)
                Spacer()
                    .frame(width: 20)
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.orange)
                    .frame(width: 150 , height: 150)
            }
            .padding(.horizontal)
            .padding(.top,10)
            
            
            Spacer()
           
        }
    }
}

struct Day11_Previews: PreviewProvider {
    static var previews: some View {
        Day11()
    }
}

//  Day20.swift
//  25/6/23

import SwiftUI

struct Day20: View {
    
    @State var randomInt = Int.random(in: 1..<100)
    
    
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            Text("\(randomInt)")
                .font(.system(size: 50 , weight: .bold , design: .default))
                .padding()
                .background{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.secondary.opacity(0.2))
                        .frame(width: 100)
                }
            
            ButtonView(randomInt: $randomInt)
                .padding(.top)
            
            Spacer()

            
        }
    }
}


struct ButtonView: View {
    
    @Binding var randomInt: Int
    
    var body: some View {
        Button(action: {
            randomInt = Int.random(in: 1..<100)
        }, label: {
            Text("Generate Number")
                .foregroundColor(.white)
                .font(.system(size: 17,weight: .regular , design: .default))
                .background{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.accentColor)
                        .frame(width: 180 , height: 45)
                }
                
        })
    }
}

struct Day20_Previews: PreviewProvider {
    static var previews: some View {
        Day20()
    }
}

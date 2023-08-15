//  Day71.swift
//  15/8/23

import SwiftUI

struct CustomButtonStyle: ButtonStyle{
    
    @State var scaleAmount: CGFloat = 0
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaleAmount : 1)
    }
    
}

extension View{
    func scalableButton(scaleAmount: CGFloat) -> some View{
        buttonStyle(CustomButtonStyle(scaleAmount: scaleAmount))
    }
}

struct Day71: View {
    var body: some View {
        VStack{
            Circle()
                .foregroundColor(.gray.opacity(0.1))
                .frame(height: 100)
                .padding(.top,100)
            VStack{
                Rectangle()
                    .foregroundColor(.gray.opacity(0.1))
                    .frame(height: 55)
                    .frame(maxWidth:  .infinity)
                    .cornerRadius(5)
                    .padding()
                    .padding(.horizontal)
                Rectangle()
                    .foregroundColor(.gray.opacity(0.1))
                    .frame(height: 55)
                    .frame(maxWidth:  .infinity)
                    .cornerRadius(5)
                    .padding()
                    .padding(.horizontal)
            }
            .padding(.top,100)
            Spacer()
            Button {
                
            } label: {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth:  .infinity)
                    .background(.orange)
                    .cornerRadius(5)
                    .padding()
                    .padding(.horizontal)
                    .shadow(color:.orange.opacity(0.3),radius: 10 , y:10)
            }
            .scalableButton(scaleAmount: 0.95)
            .padding(.bottom)

        }
    }
}

struct Day71_Previews: PreviewProvider {
    static var previews: some View {
        Day71()
    }
}

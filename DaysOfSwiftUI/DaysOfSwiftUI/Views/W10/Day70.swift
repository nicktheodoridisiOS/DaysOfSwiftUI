//  Day70.swift
//  14/8/23

import SwiftUI

struct CustomViewMoidifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .cornerRadius(20)
            .frame(width: 200,height: 200)
            .shadow(color: .black.opacity(0.1),radius: 20)
    }
}

extension View{
    func withCustomViewModifier() -> some View{
        modifier(CustomViewMoidifier())
    }
}

struct Day70: View {
    
    @State var isDisabled:Bool = false
    
    var body: some View {
        VStack{
            Button {
                withAnimation(.spring()){
                    isDisabled.toggle()
                }
            } label: {
                Text(isDisabled ? "Disable Modifier" : "Enable Modifier")
            }
            .buttonStyle(.bordered)
            .tint(.orange)
            .padding(.top,20)
            
            Spacer()
            
            ZStack{
                Rectangle()
                    .withCustomViewModifier()
                    .scaleEffect(isDisabled ? 1 : 0)
                Rectangle()
                    .cornerRadius(0)
                    .frame(width: 200,height: 200)
                    .scaleEffect(isDisabled ? 0 : 1)
                    
            }
            Spacer()
        }

    }
}

struct Day70_Previews: PreviewProvider {
    static var previews: some View {
        Day70()
    }
}

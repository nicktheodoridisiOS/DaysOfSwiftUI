//
//  Day69.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 13/8/23.
//

import SwiftUI

struct Day69: View {
    
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    @State  var count:Int = 1
    var body: some View {
        
        ZStack{
            TabView(selection: $count , content:  {
                AppleLogoView(logoColor: .constant(.red))
                    .tag(1)
                AppleLogoView(logoColor: .constant(.blue))
                    .tag(2)
                AppleLogoView(logoColor: .constant(.green))
                    .tag(3)
                AppleLogoView(logoColor: .constant(.orange))
                    .tag(4)
                AppleLogoView(logoColor: .constant(.white))
                    .tag(5)
            })
            .frame(height: .infinity)
            .tabViewStyle(PageTabViewStyle())
            
        }
        .onReceive(timer, perform: { _ in
            withAnimation(.spring()){
                count = count == 5 ? 1 : count + 1
            }
            
        })
    }
}

struct Day69_Previews: PreviewProvider {
    static var previews: some View {
        Day69()
    }
}

struct AppleLogoView: View {
    @Binding var logoColor: Color
    @State  var scaleAmount: CGFloat = 0
    
    var body: some View {
        VStack{
            Image(systemName: "apple.logo")
                .foregroundColor(logoColor)
                .font(.system(size: 90))
                .scaleEffect(scaleAmount)
                .onAppear{
                    withAnimation(.spring().delay(0.5)){
                        scaleAmount  = 1
                    }
                }
                .padding(.bottom,70)
            
        }
            
    }
}

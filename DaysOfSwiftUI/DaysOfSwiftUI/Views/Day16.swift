//  Day16.swift
//  21/6/23

import SwiftUI

struct Day16: View {
    var body: some View {
        ZStack{
            
            Color("aclight")
                .ignoresSafeArea(.all)
            
            VStack{
                Image(systemName: "apple.logo")
                    .font(.system(size: 80))
                    .foregroundColor(Color("acdark"))
            }
            .frame(maxWidth: .infinity , maxHeight: .infinity)
        }
    }
}

struct Day16_Previews: PreviewProvider {
    static var previews: some View {
        Day16()
    }
}

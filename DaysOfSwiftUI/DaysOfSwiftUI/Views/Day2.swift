//  Day2.swift
//  7/6/23

import SwiftUI

struct Day2: View {
    var body: some View {
        VStack(spacing: 10){
            Spacer()
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.secondary)
                .frame(width: 310 , height: 60)
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.secondary)
                .frame(width: 310 , height: 60)
            Spacer()
            Capsule()
                .foregroundColor(Color.accentColor)
                .frame(width: 150 , height: 40)
        }.padding()
        
    }
}

struct Day2_Previews: PreviewProvider {
    static var previews: some View {
        Day2()
    }
}

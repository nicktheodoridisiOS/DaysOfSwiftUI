//  Day1.swift
//  6/6/23

import SwiftUI

struct Day1: View {
    var body: some View {
        VStack{
            Text("Nick Theodoridis")
                .font(.system(size: 40,weight: .heavy,design: .default))
            
            Text(" iOS Developer")
                .font(.system(size: 25,weight: .semibold,design: .default))
                .foregroundColor(.gray)
        }
    }
}

struct Day1_Previews: PreviewProvider {
    static var previews: some View {
        Day1()
    }
}

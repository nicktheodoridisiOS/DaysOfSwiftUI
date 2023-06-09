//  Day3.swift
//  8/6/23

import SwiftUI

struct Day3: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color("rectcolor"))
                .frame(width: 310 , height: 80)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("strcolor"), lineWidth: 2)
                )
            Text("//Day3.swift")
                .font(.system(size: 20,weight: .medium,design: .monospaced))
                .foregroundColor(Color("compcolor"))
        }
        
    }
}

struct Day3_Previews: PreviewProvider {
    static var previews: some View {
        Day3()
    }
}

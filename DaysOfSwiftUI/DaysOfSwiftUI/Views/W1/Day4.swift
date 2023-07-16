//  Day4.swift
//  9/6/23

import SwiftUI

struct Day4: View {
    var body: some View {
            Text("SwiftUI")
                .font(.system(size: 100,weight:.bold,design: .default))
                .overlay{
                    LinearGradient(colors: [
                        Color("dcolors"),
                        Color("dcolorp")
                    ], startPoint: .topLeading, endPoint:.bottomTrailing)
                }
                .mask{
                    Text("SwiftUI")
                        .font(.system(size: 100,weight: .bold,design: .default))

                }
    }
}

struct Day4_Previews: PreviewProvider {
    static var previews: some View {
        Day4()
    }
}

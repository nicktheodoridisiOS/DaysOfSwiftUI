//  Day5.swift
//  10/6/23

import SwiftUI

struct Day5: View {
    var body: some View {
        Image(systemName: "swift")
            .foregroundColor(.white)
            .font(.system(size: 90))
            .frame(width: 180,height: 180)
            .background{
                RoundedRectangle(cornerRadius: 50)
                    .foregroundColor(Color("swiftcolour"))
            }
    }
}

struct Day5_Previews: PreviewProvider {
    static var previews: some View {
        Day5()
    }
}

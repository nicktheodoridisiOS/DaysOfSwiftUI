//  Day6.swift
//  11/6/23

import SwiftUI

struct Day6: View {
    var body: some View {
            Image("profile")
                .resizable()
                .frame(width: 300 , height: 300)
                .clipShape(Circle())
    }
}

struct day6_Previews: PreviewProvider {
    static var previews: some View {
        Day6()
    }
}

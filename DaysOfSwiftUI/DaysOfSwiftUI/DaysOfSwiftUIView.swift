//  DaysOfSwiftUIView.swift
//  DaysOfSwiftUI


import SwiftUI

struct DaysOfSwiftUIView: View {
    var body: some View {
        Day12(name: "Upload Day 12",priority:.high)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DaysOfSwiftUIView()
    }
}

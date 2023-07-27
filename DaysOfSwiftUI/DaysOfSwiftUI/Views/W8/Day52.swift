//  Day52.swift
//  27/7/23


import SwiftUI

struct Day52: View {
    
    @State  private var text: String = ""
    @State private var path: [String] = []
    var body: some View {
        NavigationStack(path: $path){
            VStack{
                
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarTitleMenu{
                Button("Profile"){
                    path.append("Profile")
                }
                Button("Settings"){
                    path.append("Settings")
                }
            }
            .navigationDestination(for: String.self){ value in
                Text("\(value) Screen")
            }
        }
    }
}

struct Day52_Previews: PreviewProvider {
    static var previews: some View {
        Day52()
    }
}

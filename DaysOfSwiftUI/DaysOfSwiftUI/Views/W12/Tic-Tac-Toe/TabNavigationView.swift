//
//  TabNavigationView.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 21/8/23.
//

import SwiftUI

struct TabNavigationView: View {
    var body: some View {
        TabView{
            DiscoverView()
                .tabItem(){
                    Image(systemName: "star.fill")
                    Text("Discover")
                }
            AIView()
                .tabItem(){
                    Image(systemName: "poweroutlet.type.f.fill")
                    Text("AI")
                }
            FriendView()
                .tabItem(){
                    Image(systemName: "person.2.fill")
                    Text("Multiplayer")
                }
            SettingsView()
                .tabItem(){
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .tint(.accentColor)
    }
}

struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
    }
}

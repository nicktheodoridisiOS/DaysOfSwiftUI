//
//  TabNavigationView.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 21/8/23.
//

import SwiftUI

struct TabNavigationView: View {
    
    @AppStorage("aiTfName") private var aiTfName = "You"
    @AppStorage("roundSelectedOption") private var roundSelectedOption = 0
    
    var body: some View {
        TabView{
            DiscoverView()
                .tabItem(){
                    Image(systemName: "star.fill")
                    Text("Discover")
                }
            AIView(aiTfName: $aiTfName , roundSelectedOption: $roundSelectedOption)
                .tabItem(){
                    Image(systemName: "poweroutlet.type.f.fill")
                    Text("AI")
                }
            FriendView()
                .tabItem(){
                    Image(systemName: "person.2.fill")
                    Text("Multiplayer")
                }
            SettingsView(aiTfName: $aiTfName , roundSelectedOption: $roundSelectedOption)
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

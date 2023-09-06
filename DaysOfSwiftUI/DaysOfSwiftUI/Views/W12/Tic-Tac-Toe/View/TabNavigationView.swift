//
//  TabNavigationView.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 21/8/23.
//

import SwiftUI

struct TabNavigationView: View {
    
    @AppStorage("aiTfName") private var firstNamePlayerTf = "You"
    @AppStorage("roundSelectedOption") private var roundSelectedOption = 0
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    
    var body: some View {
        TabView{
            DiscoverView()
                .tabItem(){
                    Image(systemName: "star.fill")
                    Text("Discover")
                }
            AIView(firstNamePlayerTf: $firstNamePlayerTf , roundSelectedOption: $roundSelectedOption)
                .tabItem(){
                    Image(systemName: "poweroutlet.type.f.fill")
                    Text("AI")
                }
            AgainstMode(firstNamePlayerTf: $firstNamePlayerTf)
                .tabItem(){
                    Image(systemName: "person.2.fill")
                    Text("Against")
                }
            SettingsView(firtPlayerNameTf: $firstNamePlayerTf , roundSelectedOption: $roundSelectedOption)
                .tabItem(){
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .tint(.accentColor)
        .environment(\.colorScheme, isDarkModeEnabled ? .dark : .light)
    }
}

struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
    }
}

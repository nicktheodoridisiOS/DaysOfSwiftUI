//  Day49.swift
//  24/7/23

import SwiftUI

struct Day49: View {
    
    @State private var showBadge:Bool  = true

        var body: some View {
            TabView {
                Text("Favourites")
                    .tabItem{
                        Image(systemName: "star")
                        Text("Favourites")
                        
                    }
                
                Text("Recents")
                    .tabItem{
                        Image(systemName: "clock")
                        Text("Recents")
                        
                    }
                    .badge(showBadge ? 5 : 0)
                    .onAppear {
                        showBadge = false
                    }
                
                Text("Contacts")
                    .tabItem{
                        Image(systemName: "person.crop.circle.fill")
                        Text("Contacts")
                        
                    }
                Text("Keypad")
                    .tabItem{
                        Image(systemName: "circle.grid.3x3.fill")
                        Text("Keypad")
                        
                    }
                Text("Voicemail")
                    .tabItem{
                        Image(systemName: "recordingtape")
                        Text("Voicemail")
                        
                }
                    
            }
        }
}

struct Day49_Previews: PreviewProvider {
    static var previews: some View {
        Day49()
    }
}

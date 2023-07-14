//  Day38.swift
//  13/7/23


import SwiftUI

struct Day38: View {
    var body: some View {
        TabView{
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

struct Day38_Previews: PreviewProvider {
    static var previews: some View {
        Day38()
    }
}

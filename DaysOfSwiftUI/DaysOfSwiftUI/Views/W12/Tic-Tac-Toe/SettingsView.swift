//
//  SettingsView.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 21/8/23.
//

import SwiftUI


struct SettingsView: View {
    
    @Binding var aiTfName: String
    @Binding var roundSelectedOption: Int
    
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section(header: Text("PERSONAL DETAILS")){
                        HStack{
                            Image(systemName: "person.fill")
                                .foregroundColor(.accentColor)
                                .fontWeight(.semibold)
                            Text("First Player")
                                .fontWeight(.semibold)
                                .foregroundColor(.accentColor)
                            
                            TextField(aiTfName,text: $aiTfName)
                        }
                    }
                    
                    Section(header: Text("GAME DETAILS")){
                        HStack{
                            Image(systemName: "poweroutlet.type.f.fill")
                                .foregroundColor(.yellow)
                                .fontWeight(.semibold)
                            Picker("AI Rounds", selection: $roundSelectedOption) {
                                ForEach(1..<11) { round in
                                    Text("\(round)")
                                }
                            }
                        }
                    }
                    
                    Section(header: Text("APPEARANCE")){
                        HStack{
                            Image(systemName: "moon.fill")
                            Toggle("Dark Mode" , isOn: $isDarkModeEnabled)
                        }
                    }
                    
                    
                }.navigationTitle("Settings")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(aiTfName: .constant(""),roundSelectedOption: .constant(0))
    }
}

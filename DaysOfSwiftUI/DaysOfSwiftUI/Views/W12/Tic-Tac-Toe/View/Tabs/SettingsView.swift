//
//  SettingsView.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 21/8/23.
//

import SwiftUI


struct SettingsView: View {
    
    @Binding var firtPlayerNameTf: String
    @Binding var secondPlayerNameTf: String
    @Binding var roundSelectedOption: Int
    @Binding var roundAgainstSelectedOption: Int
    
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    Section(header: Text("PREFERENCES")){
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 7)
                                    .frame(width: 30,height: 30)
                                    .foregroundColor(.accentColor)
                                Image(systemName: "person.fill")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }
                            
                            TextField(firtPlayerNameTf,text: $firtPlayerNameTf)
                        }
                        
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 7)
                                    .frame(width: 30,height: 30)
                                    .foregroundColor(.red)
                                Image(systemName: "person.fill")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }
                            
                            TextField(secondPlayerNameTf,text: $secondPlayerNameTf)
                        }
                    }
                    
                    Section(header: Text("AI MODE")){
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 7)
                                    .frame(width: 30,height: 30)
                                    .foregroundColor(.yellow)
                                Image(systemName: "poweroutlet.type.f.fill")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }
                            Picker("Rounds", selection: $roundSelectedOption) {
                                ForEach(1..<11) { round in
                                    Text("\(round)")
                                }
                            }
                        }
                    }
                    
                    Section(header: Text("AGAINST MODE")){
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 7)
                                    .frame(width: 30,height: 30)
                                    .foregroundColor(.red)
                                Image(systemName: "person.2.fill")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }
                            Picker("Rounds", selection: $roundAgainstSelectedOption) {
                                ForEach(1..<11) { round in
                                    Text("\(round)")
                                }
                            }
                        }
                    }
                    
                    Section(header: Text("DISPLAY"),footer: Text("Enabling dark mode is going to change the entire appearance of the application, beyond your device's general settings. ")){
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 7)
                                    .frame(width: 30,height: 30)
                                    .foregroundColor(.purple)
                                Image(systemName: "moon.fill")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }
                            Toggle("Dark Mode" , isOn: $isDarkModeEnabled)
                        }
                    }
                    
                    
                }
                .navigationTitle("Settings")
                .listStyle(.insetGrouped)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(firtPlayerNameTf: .constant(""), secondPlayerNameTf: .constant(""), roundSelectedOption: .constant(0), roundAgainstSelectedOption: .constant(0))
    }
}

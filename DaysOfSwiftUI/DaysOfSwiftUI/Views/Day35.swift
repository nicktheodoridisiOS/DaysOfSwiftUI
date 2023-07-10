//
//  Day35.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 9/7/23.
//

import SwiftUI

struct Day35: View {
    
    @State var name = ""
    @State var description = ""
    @State var date :Date = Date()
    @State var selection: String = "Low"
    let priority: [String] = ["Low" , "Medium" , "High"]
    @State var toggleIsOn: Bool = false
    @State var taskColor: Color = .primary
    
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section( header: Text("INFO")){
                        TextField("Name" , text: $name)
                        TextField("Description" , text: $description)
                        Picker(
                            selection: $selection,
                            label:
                                HStack {
                                Text("Priority")
                                }
                            ,content: {
                                ForEach(priority, id: \.self){ priority in
                                    Text(priority)
                                        .tag(priority)
                                }
                                
                            })
                        ColorPicker("Color", selection: $taskColor)
                    }
                    
                    Section( header: Text("Actions")){
                        DatePicker("Due to",selection: $date)
                        Toggle("Remind Me" , isOn: $toggleIsOn)
                        
                    }
                    
                    Button("Add Task") {
                        
                    }
                    .foregroundColor(.accentColor)
                    
                    
                }
                
                
                

            }.navigationTitle("Add Task")
        }
    }
}

struct Day35_Previews: PreviewProvider {
    static var previews: some View {
        Day35()
    }
}

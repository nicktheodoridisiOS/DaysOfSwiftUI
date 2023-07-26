//  Day51.swift
//  26/7/23

import SwiftUI

struct Day51: View {
    
    var body: some View {
        NavigationView{
            ScrollView{
                
            }
            .navigationTitle("Notes")
            .toolbar{
                ToolbarItem(placement: .bottomBar){
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.orange)
                        .overlay{
                            NavigationLink("", destination: AddView())
                        }
                        .frame(maxWidth: .infinity , alignment:.bottomTrailing)
                        .padding()
                        .padding(.horizontal)
                        
                }
            }
            
        }
    }
}

struct AddView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack{
            TextEditor(text: $text)
                .font(.title)
                .bold()
                .padding()
                .toolbar{
                    ToolbarItem(placement: .keyboard){
                        Image(systemName: "xmark")
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity , alignment:.bottomTrailing)
                            .padding()
                            .padding(.horizontal)
                    }
                }
        }
        .navigationTitle("Add Note")
        .tint(.orange)
    }
}

struct Day51_Previews: PreviewProvider {
    static var previews: some View {
        Day51()
    }
}

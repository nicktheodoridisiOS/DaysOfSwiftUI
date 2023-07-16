//  Day32.swift
//  7/7/23

import SwiftUI

struct Day32: View {
    
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                Form{
                    Section(header: Text("")){
                        Toggle("Bluetooth" , isOn: $toggleIsOn)
                    }
                }
                .frame(maxHeight:80)
                Text("This iPhone is discoverable as Nick while \n bluetooth Settings is open")
                    .bold()
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity , alignment: .topLeading)
                    .padding(.horizontal,25)
                    .padding(.top,5)
                
                Form{
                    Section(header: Text("DEVICES"), content: {
                        Button {
                            
                        } label: {
                            HStack{
                                Text("Nick's Apple Watch")
                                    .foregroundColor(.white)
                                Spacer()
                                Text("Connected")
                                    .foregroundColor(.secondary)
                                    .bold()
                                Image(systemName: "info.circle")
                                    .foregroundColor(.accentColor)
                                    .font(.title2)
                            }
                        }
                        
                    })
                    
                }
                .opacity(toggleIsOn ? 1 : 0)
                
                
                
            }
            
            
        }
    }
    
}


struct Day32_Previews: PreviewProvider {
    static var previews: some View {
        Day32()
    }
}

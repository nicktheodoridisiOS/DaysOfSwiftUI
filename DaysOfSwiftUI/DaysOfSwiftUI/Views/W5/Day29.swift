//  Day29.swift
//  4/7/23

import SwiftUI

struct Day29: View {
    var body: some View {
        VStack{
            HStack(){
                Button {
                    
                } label: {
                    Image("icon")
                        .resizable()
                        .foregroundColor(.accentColor)
                        .frame(width: 100,height: 100)
                        .contextMenu(menuItems: {
                            Button {
                                
                            } label: {
                                Label("Copy", systemImage: "doc.on.doc")
                            }
                            
                            Button {
                                
                            } label: {
                                Label("Share", systemImage: "square.and.arrow.up")
                            }
                            
                            Button {
                                
                            } label: {
                                Label("Favourite", systemImage: "heart")
                            }

                        })
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity , alignment: .topLeading)
        .padding()
        .padding(.top , 20)
        
        
     
    }
}

struct Day29_Previews: PreviewProvider {
    static var previews: some View {
        Day29()
    }
}

//
//  Day60.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 4/8/23.
//

import SwiftUI

struct Day60: View {
    
    var body: some View {
        ScrollView(showsIndicators: false){
            ScrollViewReader{ proxy in
                
                Button(action: {
                    withAnimation(.spring()){
                        proxy.scrollTo(9,anchor: .top)
                    }
                }, label: {
                    Circle()
                        .foregroundColor(.orange)
                        .frame(width: 50)
                        .overlay{
                            Image(systemName: "arrow.down")
                                .foregroundColor(.primary)
                        }
                })
                .padding(.top)
                
               ForEach(0..<10){ index in
                   VStack(spacing: 0){
                       HStack{
                           Circle()
                               .frame(width: 50)
                               .foregroundColor(Color.primary.opacity(0.5))
                              
                               .id(index)
                           
                           RoundedRectangle(cornerRadius: 10)
                               .foregroundColor(Color("rectcolor"))
                               .padding()
                               .frame(height: 90)
                       }
                       .padding()
                       HStack{
                           RoundedRectangle(cornerRadius: 10)
                               .foregroundColor(.gray.opacity(0.2))
                               .padding()
                               .frame(height: 90)
                           
                           Circle()
                               .frame(width: 50)
                               .overlay{
                                   Image("profile")
                                       .resizable()
                                       .clipShape(Circle())
                               }
                       }
                       .padding()
                   }
                }
                
            }
        }
        
    }
}

struct Day60_Previews: PreviewProvider {
    static var previews: some View {
        Day60()
    }
}

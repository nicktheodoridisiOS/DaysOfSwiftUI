//
//  Day13.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 17/6/23.
//

import SwiftUI

struct Day13: View {
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Text("Notification Centre")
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .font(.system(size: 27 , weight: .bold,design: .default))
                
                Circle()
                    .frame(height: 40)
                    .foregroundColor(Color("rectcolor"))
                    .overlay{
                        Image(systemName: "xmark")
                            .font(.system(size: 15,weight: .regular,design: .rounded))
                            .foregroundColor(.secondary)
                    }
                
            }
            
            ForEach(0..<3, content: { index in
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 75)
                    .foregroundColor(Color("rectcolor"))
                    .overlay{
                        HStack(spacing: 10){
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 50,height: 50)
                                .foregroundColor(.accentColor)
                            VStack(alignment: .leading){
                                HStack(spacing: 10){
                                    RoundedRectangle(cornerRadius: 6)
                                        .frame(width: 200,height: 15)
                                        .foregroundColor(.accentColor)
                                    Spacer()
                                    RoundedRectangle(cornerRadius: 6)
                                        .frame(width: 30,height: 15)
                                        .foregroundColor(.gray.opacity(0.5))
                                    
                                }
                                
                                RoundedRectangle(cornerRadius: 4)
                                    .frame(width: 150,height: 10)
                                    .foregroundColor(.gray.opacity(0.3))
                            }.padding(.bottom,16)
                            
                            Spacer()
                            
                           
                        }.padding()
                    }
                    
            })
            HStack{
                Circle()
                    .frame(height: 60)
                    .foregroundColor(Color("rectcolor"))
                    .overlay{
                        Image(systemName: "flashlight.off.fill")
                            .font(.title2)
                    }
                Spacer()
                Circle()
                    .frame(height: 60)
                    .foregroundColor(Color("rectcolor"))
                    .overlay{
                        Image(systemName: "camera.fill")
                            .font(.title2)
                    }
            }
            .padding()
            .frame(maxWidth: .infinity , alignment: .leading)
            
            
        }.padding()
    }
}

struct Day13_Previews: PreviewProvider {
    static var previews: some View {
        Day13()
    }
}

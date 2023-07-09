//  Day34.swift
//  9/7/23

import SwiftUI

struct Day34: View {
    
    @State var rectColor: Color = .white
    @State var primaryTextColor: Color = .black
    @State var secondaryTextColor: Color = .secondary
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(rectColor)
                    .frame(width: .infinity,height: 300)
                    .shadow(radius: 10)
                    .padding()
                    .overlay{
                        VStack(alignment:.leading,spacing: 20){
                            HStack(spacing: 15){
                                Image("igProfile")
                                    .resizable()
                                    .frame(width: 45,height: 45)
                                    .clipShape(Circle())
                                VStack(alignment: .leading){
                                    Text("Nick Theodoridis")
                                        .foregroundColor(primaryTextColor)
                                        .bold()
                                    
                                    Text("iOS Developer")
                                        .font(.caption)
                                        .foregroundColor(secondaryTextColor)
                                        
                                }
                            }
                            .frame(maxWidth: .infinity , alignment:.topLeading)
                            
                          
                            Text("Hey everyone! 👋🏼\nWe are on day 34, I am very excited with the progress of the project, and we have several days to present more capabilities about SwiftUI.")
                                .foregroundColor(primaryTextColor)
                           
                            Text("100 Days of SwiftUI • Day 34")
                                .foregroundColor(secondaryTextColor)
                                .font(.caption)
                           
                        }
                        .padding()
                        .padding(.horizontal,20)
                    }
                Spacer()
                VStack(spacing: 10){
                    ColorPicker("Background Color", selection: $rectColor)
                        .foregroundColor(.secondary)
                        .bold()
                        .padding()
                        .padding(.horizontal)
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color("rectcolor"))
                        }
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("strcolor"))
                        }
                    ColorPicker("Primary Text Color", selection: $primaryTextColor)
                        .foregroundColor(.secondary)
                        .bold()
                        .padding()
                        .padding(.horizontal)
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color("rectcolor"))
                        }
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("strcolor"))
                        }
                    
                    ColorPicker("Secondary Text Color", selection: $secondaryTextColor)
                        .foregroundColor(.secondary)
                        .bold()
                        .padding()
                        .padding(.horizontal)
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color("rectcolor"))
                        }
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("strcolor"))
                        }
                }
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity , alignment:.topLeading)
            .navigationTitle("Edit Colors")
        }
    }
}

struct Day34_Previews: PreviewProvider {
    static var previews: some View {
        Day34()
    }
}

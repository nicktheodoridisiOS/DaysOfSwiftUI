//
//  Day15.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 19/6/23.
//

import SwiftUI

struct Day15: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(),spacing: 1,alignment: nil), GridItem(.flexible(),spacing: 1,alignment: nil),
        GridItem(.flexible(),spacing: 1,alignment: nil)
        

    ]
    
    var body: some View {
        ScrollView{
            VStack(spacing: 30){
                HStack(spacing: 80){
                    Text("nickmadethisone")
                        .font(.system(size: 18,weight: .heavy,design: .default))
                }
                HStack(spacing: 40){
                    Image("igProfile")
                        .resizable()
                        .frame(width: 90 , height: 90)
                        .clipShape(RoundedRectangle(cornerRadius: 60))
                        .background{
                            Circle()
                                .stroke(Color.gray.opacity(0.5))
                                .frame(width: 100,height: 100)
                        }
                       
                    
                    HStack(spacing: 20){
                        VStack{
                            Text("25")
                                .font(.system(size: 17,weight: .heavy,design: .default))

                            Text("Posts")
                                .font(.system(size: 12,weight: .regular,design: .default))
                        }
                        VStack{
                            Text("47")
                                .font(.system(size: 17,weight: .heavy,design: .default))

                            Text("Followers")
                                .font(.system(size: 12,weight: .regular,design: .default))
                        }
                        VStack{
                            Text("69")
                                .font(.system(size: 17,weight: .heavy,design: .default))

                            Text("Following")
                                .font(.system(size: 12,weight: .regular,design: .default))
                        }
                    }.padding()
                }.frame(maxWidth: .infinity)
                VStack(alignment: .leading,spacing: 2){
                    Text("Nick Theodoridis • iOS Developer")
                        .font(.system(size: 15,weight: .heavy,design: .default))
                    Text("Digital creator")
                        .font(.system(size: 15,weight: .regular,design: .default))
                        .foregroundColor(Color("igColor"))
                    HStack(spacing: 5){
                        Text("🪴 Welcome to")
                            .font(.system(size: 15,weight: .regular,design: .default))
                        Text("@nickmadethisone")
                            .font(.system(size: 15,weight: .regular,design: .default))
                            .foregroundColor(Color("igColor"))
                    }
                    Text("🇬🇷 Developer from Greece")
                        .font(.system(size: 15,weight: .regular,design: .default))
                    Text("📱 Mobile Application Developer")
                        .font(.system(size: 15,weight: .regular,design: .default))
                    HStack(spacing: 5){
                        Image(systemName: "link")
                            .foregroundColor(Color("igColor"))
                            .font(.system(size: 15,weight: .bold,design: .default))
                        Text("bio.site/nicktheodoridis")
                            .font(.system(size: 15,weight: .bold,design: .default))
                            .foregroundColor(Color("igColor"))
                    }.padding(.top,5)
                    
                }.frame(maxWidth: .infinity , alignment: .leading)
                    .padding(.top,5)
               
                HStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width:155,height: 35)
                        .foregroundColor(.accentColor)
                        .overlay{
                            Text("Follow")
                                .font(.system(size: 15,weight: .heavy,design: .default))
                                .foregroundColor(.primary)
                        }
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width:155,height: 35)
                        .foregroundColor(.gray.opacity(0.2))
                        .overlay{
                            Text("Message")
                                .font(.system(size: 15,weight: .heavy,design: .default))
                        }
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width:40,height: 35)
                        .foregroundColor(.gray.opacity(0.2))
                        .overlay{
                                Image(systemName: "person.fill.badge.plus")
                        }
                }
                HStack{
                    VStack{
                        Image("icon")
                            .resizable()
                            .frame(width: 70 , height: 70)
                            .clipShape(RoundedRectangle(cornerRadius: 60))
                            .background{
                                Circle()
                                    .stroke(Color.gray.opacity(0.5))
                                    .frame(width: 75,height: 75)
                            }
                        Text("DaysOfSwi...")
                            .font(.system(size: 13,weight: .regular,design: .default))

                    }.padding(.top,5)
                    
                }.frame(maxWidth: .infinity , alignment: .leading)
            }.padding()
            LazyVGrid(columns: columns , spacing: 1) {
                ForEach(0..<5){ index in
                    Rectangle()
                        .frame(height: 130)
                        .foregroundColor(.secondary.opacity(0.5))
                }
            }
        }
        
    }
}

struct Day15_Previews: PreviewProvider {
    static var previews: some View {
        Day15()
    }
}

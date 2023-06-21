//  Day14.swift
//  19/6/23
import SwiftUI

struct Day14: View {
    var body: some View {
        ScrollView{
            ForEach(0..<3, content: { index in
                LazyVStack(spacing: 0){
                    HStack(spacing: 0){
                        
                        Image("igProfile")
                            .resizable()
                            .frame(width: 50,height: 50)
                            .clipShape(Circle())
                            .padding()
                        
                        VStack(alignment: .leading){
                            Text("nickmadethisone")
                                .font(.system(size: 15, weight: .bold,design: .default))
                            Text("Thessalonikki,Greece")
                                .font(.system(size: 15, weight: .regular,design: .default))
                        }
                        Spacer()
                        
                    }
                    Rectangle()
                        .foregroundColor(.secondary.opacity(0.5))
                        .frame(height: 1)
                    Rectangle()
                        .frame(height: 400)
                        .foregroundColor(.black)
                    Rectangle()
                        .foregroundColor(.secondary.opacity(0.5))
                        .frame(height: 1)
                    HStack(spacing: 10){
                        Image(systemName: "heart")
                            .foregroundColor(.primary)
                            .font(.title)
                        Image(systemName: "message")
                            .foregroundColor(.primary)
                            .font(.title)
                        Image(systemName: "paperplane")
                            .foregroundColor(.primary)
                            .font(.title)
                        Spacer()
                        Image(systemName: "bookmark")
                            .foregroundColor(.primary)
                            .font(.title)
                    }.padding()
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("nickmadethisone")
                                .font(.system(size: 15, weight: .bold,design: .default))
                            Text("100 Days of SwiftUI • Day 14")
                                .font(.system(size: 15, weight: .regular,design: .default))
                            
                        }.frame(maxWidth: .infinity , alignment: .leading).padding()
                        
                    }
                    
                }.padding(.top,20)
            }
        )}
        
    }
    
    
    struct Day14_Previews: PreviewProvider {
        static var previews: some View {
            Day14()
        }
    }
    
}

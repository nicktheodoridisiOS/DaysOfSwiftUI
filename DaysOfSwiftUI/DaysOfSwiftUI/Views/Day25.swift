//
//  Day25.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 29/6/23.
//

import SwiftUI

struct Day25: View {
    var body: some View {
        NavigationView{
            ScrollView{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.gray.opacity(0.2))
                    .frame(height: 150)
                    .overlay{
                        VStack(alignment: .leading , spacing: 10){
                            Text("#swiftui • #xcode • #ios16")
                                .foregroundColor(.secondary)
                                .font(.system(size: 10,weight: .semibold,design: .default))
                            Text("Day 25: Navigation View and its features.")
                                .font(.title2)
                                .bold()
                            NavigationLink("Learn more >", destination: SecondScreen())
                            
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity ,alignment:.topLeading)
                       
                    }
                        
                
            }
            .padding(.top)
            .padding(.horizontal)
            .navigationTitle("Discover")
            
        }
    }
}


struct  SecondScreen:View{
    
    
    var body: some View{
        ScrollView{
            VStack(alignment: .leading){
                
                HStack{
                    Image("igProfile")
                        .resizable()
                        .frame(width: 20,height: 20)
                        .clipShape(Circle())
                    
                    Text("Nick Theodoridis • iOS Developer ")
                        .foregroundColor(.secondary)
                        .font(.system(size: 10))
                }
                .padding(.bottom)
                .padding(.top)
                
                Text("This particular day has a goal to present the power of the Navigation View container and its features such as Navigation Title, Navigation Bar and Navigation Link.")
            }
            .padding(.top)
            .frame(maxWidth: .infinity,alignment: .topLeading)
            .padding(.horizontal)
        }
        .navigationTitle("Day 25")
    }
}

struct Day25_Previews: PreviewProvider {
    static var previews: some View {
        Day25()
    }
}


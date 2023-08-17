//
//  Day73.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 17/8/23.
//

import SwiftUI

struct Day73: View {
    
    @State   private var isExpanded: Bool = false;
    @State private var searchText: String = "" ;
    @Namespace private var namespace;
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    if(!isExpanded){
                        expandedView
                    }
                    else{
                        collapsedView
                    }
                }
                .navigationTitle("Users")
                .padding()
            }
            .searchable(text: $searchText)
        }
        
        
    }
    
    var expandedView: some View{
        HStack(spacing: 10){
            ZStack{
                Image("profile")
                    .resizable()
                    .frame(width: 50,height: 50)
                    .clipShape(Circle())
                    .onTapGesture {
                        withAnimation(.spring()){
                            isExpanded.toggle()
                        }
                    }
                    .matchedGeometryEffect(id: "profile", in: namespace)
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 17)
                    .overlay{
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.orange)
                            .font(.caption2)
                    }
                .matchedGeometryEffect(id: "profile", in: namespace)

            }
       
            
            VStack(alignment: .leading,spacing: 2){
                HStack(spacing: 3){
                    Text("Nick Theodoridis")
                        .fontWeight(.semibold)
                    Image(systemName: "apple.logo")
                }
                
                Text("iOS Developer")
                    .foregroundColor(.secondary)
            }
        
            Spacer()
            
            Button("Follow"){
                
            }
            .buttonStyle(.bordered)
            .tint(.orange)
    
            
            
        }
        .frame(maxWidth: .infinity ,maxHeight: .infinity, alignment: .topLeading)
    }
    
    var collapsedView: some View{
        HStack(spacing: 0){
            HStack(spacing: 0){
                HStack(spacing: 20){
                    VStack{
                        Text("8")
                            .font(.system(size: 25))
                            .bold()
                        Text("Projects")
                            
                            .foregroundColor(.secondary)
                            .font(.caption2)
                        
                    }
                    .frame(width: 80)
                    VStack{
                        Text("103")
                            .font(.system(size: 25))
                            .bold()
                        Text("Followers")
               
                            .foregroundColor(.secondary)
                            .font(.caption2)
                    }
                    
                    .frame(width: 80)
                    VStack{
                        Text("74")
                            .font(.system(size: 25))
                            .bold()
                        Text("Following")
                   
                            .foregroundColor(.secondary)
                            .font(.caption2)
                    }
                    
                    .frame(width: 80)
                }
            }
            Spacer()
            ZStack{
                Image("profile")
                    .resizable()
                    .frame(width: 50,height: 50)
                    .clipShape(Circle())
                    .onTapGesture {
                        withAnimation(.spring()){
                            isExpanded.toggle()
                        }
                    }
                    .matchedGeometryEffect(id: "profile", in: namespace)
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 17)
                    .overlay{
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.orange)
                            .font(.caption2)
                    }
                .matchedGeometryEffect(id: "profile", in: namespace)

            }
       
            
        }
    }
    
}

struct Day73_Previews: PreviewProvider {
    static var previews: some View {
        Day73()
    }
}


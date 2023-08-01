//  Day57.swift
//  1/8/23

import SwiftUI

struct Day57: View {
    
    @State var currentAmmount: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 0){
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(0..<20){ _ in
                        Circle()
                    }
                }
                .foregroundColor(.secondary.opacity(0.2))
                .frame(height: 70)
                .frame(maxWidth: .infinity,alignment: .topLeading)
                .padding()
            }
          
            VStack{
                Divider()
                HStack(spacing: 10){
                    Image("igProfile")
                        .resizable()
                        .frame(width: 35,height: 35)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading){
                        Text("nickmadethisone")
                            .font(.system(size: 15, weight: .bold,design: .default))
                        Text("Thessalonikki,Greece")
                            .font(.system(size: 12, weight: .regular,design: .default))
                    }
                    
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.primary)
                    })
                    .padding(.horizontal)
                }
                .padding(.horizontal)
                
                
                Divider()
            }
           
            Image("icon")
                .resizable()
                .scaledToFit()
                .scaleEffect(1 + currentAmmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged{ value in
                            currentAmmount = value -  1
                        }
                        .onEnded{ value in
                            withAnimation(.spring()){
                                currentAmmount = 0
                            }
                            
                        }
                )
            
            Spacer()
    
        }.padding(.top)
    }
}

struct Day57_Previews: PreviewProvider {
    static var previews: some View {
        Day57()
    }
}

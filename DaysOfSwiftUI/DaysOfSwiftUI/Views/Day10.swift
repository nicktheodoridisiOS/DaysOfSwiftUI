//  Day10.swift
//  15/6/23

import SwiftUI

struct Day10: View {
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack(spacing: 80){
                Text(" NICK THEODORIDIS")
                    .font(.system(size: 16,weight: .bold,design: .default))
                    .padding(.top,20)
                
                ZStack{
                    Capsule()
                        .foregroundColor(.white)
                        .frame(width: 80 , height: 30)
                        .padding(.top,20)
                    
                    Text("Contact")
                        .foregroundColor(.black)
                        .font(.system(size: 13,weight: .regular,design: .default))
                        .padding(.top , 20)
                }
    
                
            }
            
            Text("100 Days Of SwiftUI")
                .font(.system(size: 25,weight: .bold,design: .default))
                .padding(.top,20)
            
            Text("June 15, 2023")
                .font(.system(size: 18,weight: .regular,design: .default))
                .foregroundColor(.gray)
                .padding(.bottom,30)
            
            Image("icon")
                .resizable()
                .frame(width: 240,height: 240)
                .clipShape(RoundedRectangle(cornerRadius: 30))
            
            Text("Digital Calendar")
                .font(.system(size: 25,weight: .heavy,design: .default))
                .padding(.top,30)
            
            Text("100 days of SwiftUI challenge is live now and there is a digital calendar which created to inform you in which week the challenge is. Every week has a digital badge by it complition turned on and filled with a colour gradient.")
                .font(.system(size: 18,weight: .medium,design: .default))
                .padding(.top,5)
            
            Text("Learn more about Digital Calendar >")
                .foregroundColor(.accentColor)
                .padding(.top,10)
            
            HStack{
                Image("igProfile")
                    .resizable()
                    .frame(width: 20,height: 20)
                    .clipShape(Circle())
               
                Text("Nick Theodoridis • iOS Developer ")
                    .font(.system(size: 12,weight: .regular,design: .default))
                    .foregroundColor(.gray)

                    
            }.padding(.top)
            
            
            
        }
        .frame(maxWidth: .infinity , maxHeight: .infinity , alignment: .topLeading)
        .padding(.horizontal,30)
           
        
    }
}

struct Day10_Previews: PreviewProvider {
    static var previews: some View {
        Day10()
    }
}

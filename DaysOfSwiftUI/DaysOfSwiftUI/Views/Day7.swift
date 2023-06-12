//  Day7.swift
//  12/6/23

import SwiftUI

struct Day7: View {
    var body: some View {
        HStack(){
            Image("icon")
                .resizable().frame(width: 60 , height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            VStack(){
                Text("100 Days Of SwiftUI")
                    .font(.system(size: 23,weight: .semibold,design: .default))
                    .frame(maxWidth: .infinity , alignment: .leading)
                    
                Text("Icon Updated")
                    .font(.system(size: 18,weight: .regular,design: .default))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity , alignment: .leading)
                    
                    
            }.padding()
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 90)
                .foregroundColor(Color.gray.opacity(0.15))
        }
       
        
    }
}

struct Day7_Previews: PreviewProvider {
    static var previews: some View {
        Day7()
    }
}

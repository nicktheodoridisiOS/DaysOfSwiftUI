//  Day17.swift
//  23/6/23

import SwiftUI

struct Day18: View {
    
    @State private var isFilled: Bool = false
    @State private var likeCount: Int = 99
    
    var body: some View {
        VStack(spacing: 20){
         
            Text("\(likeCount) Likes")
                .font(.system(size: 20 , weight: .semibold , design: .default))
           
            
            
            Button(action: {
                increaseLikes()
            }, label: {
                Image(systemName: isFilled ?  "heart.fill" : "heart")
                    .font(.system(size: 30))
                    .foregroundColor(.red)
            })
        }
    }
    
    
    func increaseLikes(){
        isFilled = true
        likeCount += 1
    }
}

struct Day18_Previews: PreviewProvider {
    static var previews: some View {
        Day18()
    }
}

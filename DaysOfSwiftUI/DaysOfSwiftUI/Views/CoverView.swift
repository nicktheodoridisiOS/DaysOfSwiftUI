//
//  CoverView.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 12/6/23.
//

import SwiftUI

struct CoverView: View {
    var body: some View {
        VStack(spacing: 30){
            Image("icon")
                .resizable().frame(width: 130 , height: 130)
                .clipShape(RoundedRectangle(cornerRadius: 40))
            VStack(spacing: 8){
                Text("100 Days Of SwiftUI")
                    .font(.system(size: 35,weight: .semibold,design: .default))
                
                Text("Project")
                    .font(.system(size: 25,weight: .regular,design: .default))
                    .foregroundColor(Color.gray)
            }
            
        }
        
    }
}

struct CoverView_Previews: PreviewProvider {
    static var previews: some View {
        CoverView()
    }
}

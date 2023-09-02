//
//  YIndicatorView.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 1/9/23.
//

import SwiftUI

struct YIndicatorView: View {
    //Animation Stater
    @State private var indicatorScaleAmount: CGFloat = 0
    
    var body: some View{
        ZStack {
            Image(systemName: "circle" )
                .font(.system(size: 40,weight: .bold))
                .foregroundColor(.yellow)
                .scaleEffect(indicatorScaleAmount)
                .background{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.yellow.opacity(0.15))
                        .frame(width: 80,height: 80)
                }
        }
        .onAppear{
            withAnimation(.spring(response: 0.2)){
                indicatorScaleAmount = 1
            }
        }
    }
}

struct YIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        YIndicatorView()
    }
}

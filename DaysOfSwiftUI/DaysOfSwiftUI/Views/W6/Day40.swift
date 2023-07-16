//  Day40.swift
//  15/7/23

import SwiftUI


struct Day40: View {
    
    @State var isTapped: Bool = false
    @State var scaleAmount: CGFloat = 1
    
    
    var body: some View {
        Image(systemName: isTapped ? "heart.fill" : "heart")
            .foregroundColor(isTapped ? .red : .primary)
            .scaleEffect(scaleAmount)
            .font(.title)
            .onTapGesture(count:2 ,perform: {
                if(!isTapped){
                    withAnimation(.spring()){
                        scaleAmount = 1.3
                    }
                    
                    withAnimation(.easeInOut(duration: 0.3))
                    {
                        scaleAmount = 1
                        
                    }
                    isTapped = true
                }
                else{
                    withAnimation(.spring()){
                        scaleAmount = 1.3
                    }
                    
                    withAnimation(.easeInOut(duration: 0.3))
                    {
                        scaleAmount = 1
                       
                    }
                    isTapped = false
                }
                
            })
    }
}

struct Day40_Previews: PreviewProvider {
    static var previews: some View {
        Day40()
    }
}

//  Day56.swift
//  31/7/23

import SwiftUI

struct Day56: View {
    
    
    @State private var isComplete: Bool = false
    @State private var isSuccess: Bool = false
    
    @State private var scaleAmount: CGFloat = 1.0
    
    var body: some View {
        VStack{
            Spacer()
            VStack(spacing: 15){
                Text("Press and hold button for one second.")
                    .font(.caption)
                    
                ZStack{
                    Capsule()
                        .foregroundColor(.orange)
                        .frame(maxWidth: isComplete ? .infinity : 0)
                        .frame(height: 5)
                        .frame(maxWidth: .infinity , alignment: .leading)
                        .background(
                            Capsule()
                                .foregroundColor(.secondary.opacity(0.5))
                        )
                        .padding(.horizontal,100)
                        .opacity(isSuccess ? 0.0 : 1.0)
                    
                    
                    Text("Success!")
                        .foregroundColor(.orange)
                        .bold()
                        .font(.caption2)
                        .opacity(isSuccess ? 1.0 : 0.0)
                }
                
            }
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("rectcolor"))
                    .frame(width: 300,height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("strcolor"), lineWidth: 1)
                    )
            }
            
            
            Spacer()
            
            ZStack{
                Circle()
                    .frame(width: 40)
                    .scaleEffect(1)
                    .scaleEffect(scaleAmount)
                    .foregroundColor(.orange)
                    .opacity(0.3)
                    .onAppear{
                        withAnimation(.easeInOut(duration: 1).repeatForever()){
                            scaleAmount = 1.5
                        }
                    }
                Circle()
                    .frame(width: 40)
                    .foregroundColor(.orange)
                    .onLongPressGesture(minimumDuration: 1.0,maximumDistance: 50) { (isPressing) in
                        
                        if(isPressing){
                            withAnimation(.easeInOut(duration: 1.0)){
                                isComplete.toggle()
                            }
                        }
                        
                    } perform: {
                        withAnimation(.easeInOut){
                            isSuccess = true
                        }
                    }
            }
            .padding(.bottom,40)
            
           
        }
    }
}

struct Day56_Previews: PreviewProvider {
    static var previews: some View {
        Day56()
    }
}


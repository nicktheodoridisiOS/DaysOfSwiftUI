//  Day58.swift
//  2/8/23

import SwiftUI

struct Day58: View {
    
    @State var angle: Angle  = Angle()
    
    var body: some View {
        VStack{
            
            
            Image(systemName: "swift")
                .font(.system(size: 90,weight: .semibold,design: .default))
                .foregroundColor(.orange)
                .rotationEffect(angle)
                .gesture(
                    RotationGesture()
                        .onChanged{ value in
                            angle = value
                        }
                        .onEnded{ value in
                            withAnimation(.spring()){
                                angle = Angle(degrees: 0)
                            }
                            
                        }
                )
            
        }
    }
}

struct Day58_Previews: PreviewProvider {
    static var previews: some View {
        Day58()
    }
}

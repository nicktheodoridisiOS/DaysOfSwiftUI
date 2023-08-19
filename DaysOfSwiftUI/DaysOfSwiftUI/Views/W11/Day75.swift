//  Day75.swift
//  19/8/23


import SwiftUI

struct Day75: View {
    @State private var animate: Bool = false
    
    var body: some View {
        
        VStack{
            
            Spacer()
            OneCornerAnimation(cornerRadius: animate ? 100 : 0)
                .frame(width: 300 , height: 300)
                .foregroundColor(.orange)
            
            
            Spacer()
            
            Button {
                withAnimation(Animation.linear(duration: 2.0).repeatForever()){
                    animate.toggle()
                }
            } label: {
                Text("Animate Shape")
            }
            .buttonStyle(.bordered)
            .tint(.orange)

        }
        
        Spacer()
        
        
         
    }
}

struct Day75_Previews: PreviewProvider {
    static var previews: some View {
        Day75()
    }
}

struct OneCornerAnimation: Shape{
    
    var cornerRadius: CGFloat
    
    var animatableData: CGFloat{
        get{ cornerRadius }
        set{ cornerRadius = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
            
            path.addArc(
                center: CGPoint(x: rect.maxX  - cornerRadius ,y:rect.maxY - cornerRadius),
                radius: cornerRadius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 360),
                clockwise: false)
            
            
            path.addLine(to: CGPoint(x: rect.maxX  - cornerRadius, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
    
            path.addLine(to: CGPoint(x: rect.minX + cornerRadius , y:rect.maxY))
            
            path.addArc(
                center: CGPoint(x: rect.minX  + cornerRadius ,y:rect.maxY - cornerRadius),
                radius: cornerRadius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 360),
                clockwise: false)
            
            path.addLine(to: CGPoint(x: rect.minX , y:rect.maxY - cornerRadius))
     
            
           
            
        }
    }
}

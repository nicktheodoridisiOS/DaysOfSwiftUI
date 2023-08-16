//  Day72.swift
//  16/8/23

import SwiftUI


struct CustomRotation: ViewModifier{
    
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(rotation)
    }
}

extension AnyTransition{
    static var rotation: AnyTransition{
        return AnyTransition.modifier(active: CustomRotation(rotation: 0), identity: CustomRotation(rotation: 1))
    }
    static var rotatingOn: AnyTransition{
        return AnyTransition.asymmetric(
            insertion: .rotation,
            removal: .move(edge: .leading))
    }
}

struct Day72: View {
    
    @State private var show: Bool = false
    
    var body: some View {
        VStack{
            
            if show{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 200,height: 250)
                    .foregroundColor(.orange.opacity(0.2))
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .transition(.rotatingOn)
            }
            
            
            Button {
                withAnimation(.easeInOut){
                    show.toggle()
                }
                
            } label: {
                HStack{
                    
                    Image(systemName: "pencil")
                    Text("Edit")
                }
            }
            .bold()
            .buttonStyle(.bordered)
            .tint(.orange)

        }
    }
}

struct Day72_Previews: PreviewProvider {
    static var previews: some View {
        Day72()
    }
}

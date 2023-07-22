//  Day46.swift
//  21/7/23

import SwiftUI


struct Day46: View {
    @State var material:Bool = false
    
    var body: some View {
       
        VStack(spacing: 100){
            VStack{
                VStack{
                }
                .frame(height: 250)
                .frame(maxWidth: 250)
                .background(material ? .ultraThinMaterial : .ultraThickMaterial)
                .cornerRadius(30)
                .padding()
            }
            .ignoresSafeArea()
            .background(
                Image("icon")
                    .resizable()
                    .frame(width: 250 ,height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            )
        
            
            Text("Apply Material")
                .foregroundColor(.white)
                .onTapGesture {
                    material.toggle()
                }
                .background{
                    Capsule()
                        .foregroundColor(.accentColor)
                        .frame(width: 150, height: 40)
                }
          
        }
   
    }
}

struct Day46_Previews: PreviewProvider {
    static var previews: some View {
        Day46()
    }
}

//  Day44.swift
//  19/7/23


import SwiftUI

struct Day44: View {
    
    @AppStorage("NUMBER_KEY") var counter = 0
    @State var scaleAmount: CGFloat = 1
    
    
    var body: some View {
        VStack(spacing: 60){
            Text("\(counter)")
                .font(.system(size: 100 ,weight: .semibold, design: .rounded))
                .foregroundColor(.primary)
                .scaleEffect(scaleAmount)
                
            
            HStack(spacing: 10){
                Capsule()
                    .foregroundColor(.green)
                    .frame(width: 100,height: 50)
                    .onTapGesture {
                        withAnimation(.spring()){
                            scaleAmount = 1.5
                            counter += 1
                        }
                        
                        withAnimation(.easeInOut)
                        {
                            scaleAmount = 1
                            
                        }
                        
                    }
                    .overlay{
                        Text("Add")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                    
                
                
                Capsule()
                    .foregroundColor(.red)
                    .frame(width: 150,height: 50)
                    .onTapGesture {
                        counter = 0
                    }
                    .overlay{
                        Text("Reset Counter")
                            .foregroundColor(.white)
                            .bold()
                        
                        
                        
                    }
            }
        }
    }
    
    struct Day44_Previews: PreviewProvider {
        static var previews: some View {
            Day44()
        }
    }
}

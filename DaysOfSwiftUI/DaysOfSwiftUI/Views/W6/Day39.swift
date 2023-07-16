//  Day39.swift
//  14/7/23


import SwiftUI

struct Day39: View {
    
    @State var scaleAmount:CGFloat = 1
    @State var isHomeScreen:Bool = false
    @State var textOpacity: CGFloat = 0
    
    var body: some View {
        ZStack{
           
            
            if(isHomeScreen){
                
             
                
                Text("This is the 39th day of SwiftUI.")
                    .bold()
                    .foregroundColor(.orange)
                    .opacity(textOpacity)
                    .onAppear(){
                        withAnimation(.spring()){
                            textOpacity = 1
                        }
                    }
                
                    
            }
            else{
                
                Color.orange
                Circle()
                    .frame(width: 100 , height: 100)
                    .scaleEffect(scaleAmount)
                    .foregroundColor(.white)
            }
        }
        .ignoresSafeArea(.all)
        .onAppear(perform: {
            withAnimation(.spring().delay(0.5)){
                scaleAmount = 0.5
            }
            
            withAnimation(.easeInOut(duration: 1).delay(1))
            {
                scaleAmount = 100
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                isHomeScreen  = true
            }
        })
    }
}

struct Day39_Previews: PreviewProvider {
    static var previews: some View {
        Day39()
    }
}

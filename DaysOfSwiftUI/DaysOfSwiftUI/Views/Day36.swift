//  Day36.swift
//  11/7/23

import SwiftUI

struct Day36: View {
    
    @State var radiusIncreament: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 50){
            HStack(spacing: 0){
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 50)
                    .padding()
                    .foregroundColor(Color("rectcolor"))
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("strcolor"))
                            .padding()
                        Stepper(label: {
                            Text("Corner Radius")
                                .foregroundColor(.secondary)
                                .font(.system(size: 14,weight: .bold))
                        }, onIncrement: {
                            increase(amount: 1)
                        }, onDecrement: {
                            increase(amount: -1)
                        })
                        
                        .padding()
                        .padding(.horizontal)
                        
                    }
                RoundedRectangle(cornerRadius: 10)
                    .frame(width:60,height: 50)
                    .padding()
                    .foregroundColor(Color("rectcolor"))
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("strcolor"))
                            .padding()
                        Text("\(Int(radiusIncreament))")
                            .foregroundColor(.accentColor)
                            .bold()
                    }
                
                
            }
           
            RoundedRectangle(cornerRadius: radiusIncreament)
                .foregroundColor(.accentColor)
                .frame(width: 200,height: 200)
            
            Spacer()
          
        }
        .frame(maxWidth: .infinity , maxHeight: .infinity , alignment: .topLeading)
        .padding()
            
    }
    
    func increase(amount: CGFloat){
        withAnimation(.spring()){
            radiusIncreament += amount
        }
    }
}

struct Day36_Previews: PreviewProvider {
    static var previews: some View {
        Day36()
    }
}

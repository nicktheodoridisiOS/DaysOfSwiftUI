//  Day55.swift
//  30/7/23


import SwiftUI

struct Day55: View {
    var body: some View {
        VStack{
            Menu("Generate Menu"){
                Button {
                    
                } label: {
                    HStack{
                        Text("Third Choice")
                        Image(systemName: "3.circle")
                    }
                }
                Button {
                    
                } label: {
                    HStack{
                        Text("Second Choice")
                        Image(systemName: "2.circle")
                    }
                }
                Button {
                    
                } label: {
                    HStack{
                        Text("First Choice")
                        Image(systemName: "1.circle")
                    }
                }

                
                
            }
            .foregroundColor(.white)
            .bold()
            .background{
                Capsule()
                    .foregroundColor(.orange)
                    .frame(width: 150 , height: 35)
            }
            
        }
    }
}

struct Day55_Previews: PreviewProvider {
    static var previews: some View {
        Day55()
    }
}

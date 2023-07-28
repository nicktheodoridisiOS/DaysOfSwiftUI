//  Day53.swift
//  28/7/23

import SwiftUI

struct Day53: View {
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack{
            Button(action: {
                showSheet.toggle()
            }, label: {
                Text("Open")
                    .foregroundColor(.white)
                    .bold()
                    .background{
                        Capsule()
                            .foregroundColor(.orange)
                            .frame(width: 70 , height: 30)
                    }
            })
            .sheet(isPresented: $showSheet) {
                SecondScreenView()
                    .presentationDetents([.medium , .large])
                    .presentationDragIndicator(.hidden)
            }

        }
        
        

    }
}

struct SecondScreenView:View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View{
        VStack{
            
        }
    }
    
    struct Day53_Previews: PreviewProvider {
        static var previews: some View {
            Day53()
        }
    }
}

//  Day24.swift
//  29/6/23

import SwiftUI

struct Day24: View {
    
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
                            .foregroundColor(.accentColor)
                            .frame(width: 70 , height: 30)
                    }
            })
            .sheet(isPresented: $showSheet) {
                SheetScreenView()
            }

        }
        
        

    }
}


struct SheetScreenView:View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View{
        ZStack(alignment: .topLeading){
            
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.backward")
                    .font(.title3)
                    .foregroundColor(.secondary)
                    
            })
            .padding()
            .padding(.horizontal)
            .padding(.top)
            
            
        }
    }
    
    struct Day24_Previews: PreviewProvider {
        static var previews: some View {
            Day24()
        }
    }
}

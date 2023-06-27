//  Day22.swift
//  27/6/23
import SwiftUI

struct Day22: View {
    
    @State var isCRCheck: Bool = false
    @State var isTCheck: Bool = false
    @State var isCCheck: Bool = false

    
    var body: some View {
        
        VStack{
            Text("Edit Shape")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity , alignment: .topLeading)
                .padding()
            Spacer()
            VStack(alignment: .leading){
                HStack{
                    Text("Corner Radius")
                        .foregroundColor(.accentColor)
                        .bold()
                    Spacer()
                    Button {
                        withAnimation(Animation.default){
                            isCRCheck.toggle()
                        }
                        
                    } label: {
                        Image(systemName: isCRCheck ? "circle.fill" : "circle")
                            .padding()
                           
                    }
                }
                HStack{
                    Text("Change Color")
                        .foregroundColor(.accentColor)
                        .bold()
                    Spacer()
                    Button {
                        withAnimation(Animation.default){
                            isCCheck.toggle()
                        }
                        
                    } label: {
                        Image(systemName: isCCheck ? "circle.fill" : "circle")
                            .padding()
                           
                    }
                }
                HStack{
                    Text("Add Text")
                        .foregroundColor(.accentColor)
                        .bold()
                    Spacer()
                    Button {
                        withAnimation(Animation.default){
                            isTCheck.toggle()
                        }
                        
                    } label: {
                        Image(systemName: isTCheck ? "circle.fill" : "circle")
                            .padding()
                           
                    }
                }
               
            }
            .frame(maxWidth: .infinity , alignment: .topLeading)
            .padding()
            
            RoundedRectangle(cornerRadius: isCRCheck ? 50 : 0)
                .frame(width: 310 , height: 320)
                .foregroundColor(isCCheck ? .red : .accentColor)
                .overlay{
                    Text(isTCheck ? "100 days of SwiftUI" : "")
                        .bold()
                        .font(.title2)
                }
                .frame(maxWidth: .infinity , alignment: .topLeading)
                .padding()
            Spacer()
        }
        .padding()
        

    }
}

struct Day22_Previews: PreviewProvider {
    static var previews: some View {
        Day22()
    }
}

//  Day23.swift
//  28/6/23

import SwiftUI

struct Day23: View {
    
    @State var isAnimated = false
    
    var body: some View {
        ZStack(alignment: .bottom){
            
            
            VStack{
                Button {
                    withAnimation(.spring()){
                        isAnimated.toggle()
                    }
                } label: {
                    Image(systemName: "info.circle")
                        .foregroundColor(.accentColor)
                        .font(.title2)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity , alignment: .bottomTrailing)
            .padding()
            
            if(isAnimated){
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .foregroundColor(Color("rectcolor"))
                    .transition(.move(edge: .bottom))
                    .overlay{
                        
                        VStack(spacing: 5){
                            Spacer()
                                Text("This animation created using")
                                    .font(.system(size: 17 , design: .monospaced))
                                HStack{
                                    Text(".transition()")
                                        .font(.system(size: 17 , design: .monospaced))
                                        .foregroundColor(Color("commandColor1"))
                                    Text("modifier.")
                                        .font(.system(size: 17 , design: .monospaced))
                        }
                        Spacer()
                             
                        VStack{
                                Text("Nick Theodoridis • iOS Developer")
                                    .font(.system(size: 10 , design: .monospaced))
                                    .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity , alignment: .center)
                        .padding()
                        .padding(.bottom)
                    }
                    .bold()
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct Day23_Previews: PreviewProvider {
    static var previews: some View {
        Day23()
    }
}

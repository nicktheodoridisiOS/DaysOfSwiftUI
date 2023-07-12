//  Day37.swift
//  11/7/23

import SwiftUI

struct Day37: View {
    
    @State var sliderValue:  Double = 0
    @State var rRadius: CGFloat = 10
    @State var rWidth: CGFloat = 200
    @State var rHeight: CGFloat = 200
    
    @State var rEnabled: Bool = false
    @State var wEnabled: Bool = false
    @State var hEnabled: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                
                RoundedRectangle(cornerRadius:  rRadius)
                    .frame(width: rWidth,height: rHeight)
                    .foregroundColor(.accentColor)
                    .padding()
                
                Spacer()
                
                VStack(alignment: .leading,spacing: 5){
                    VStack(alignment: .leading){
                        HStack{
                            Text("Width")
                                .foregroundColor(Color.gray)
                                .bold()
                            Text("\(Int(rWidth))")
                                .foregroundColor(Color.accentColor)
                                .bold()
                        }
                        Slider(value: $rWidth, in: 30...300) { _ in
                            wEnabled.toggle()
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("rectcolor"))
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("strcolor"))
                            }
                    )
                    .tint(wEnabled ? Color.accentColor : Color("strcolor"))
                    
                    VStack(alignment: .leading,spacing: 5){
                        HStack{
                            Text("Height")
                                .foregroundColor(Color.gray)
                                .bold()
                            Text("\(Int(rHeight))")
                                .foregroundColor(Color.accentColor)
                                .bold()
                        }
                        Slider(value: $rHeight, in: 30...300){ _ in
                            hEnabled.toggle()
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("rectcolor"))
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("strcolor"))
                            }
                    )
                    .tint(hEnabled ? Color.accentColor : Color("strcolor"))
                    
                    VStack(alignment: .leading,spacing: 5){
                        HStack{
                            Text("Corners")
                                .foregroundColor(Color.gray)
                                .bold()
                            Text("\(Int(rRadius))")
                                .foregroundColor(Color.accentColor)
                                .bold()
                        }
                        Slider(value: $rRadius, in: 0...300){ _ in
                            rEnabled.toggle()
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("rectcolor"))
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("strcolor"))
                            }
                    )
                    
                    .tint(rEnabled ? Color.accentColor : Color("strcolor"))
                    
                    
                    
                }
              
                Spacer()
               
            }
            .navigationTitle("Edit Shape")
            .padding()
            .padding(.top,30)
        }
    }
}

struct Day37_Previews: PreviewProvider {
    static var previews: some View {
        Day37()
    }
}

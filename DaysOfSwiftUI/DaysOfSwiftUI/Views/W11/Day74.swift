//  Day74.swift
//  18/8/23

import SwiftUI

struct Triangle: Shape{
    func path(in rect: CGRect) -> Path{
        Path{ path in
            path.move(to: CGPoint(x: rect.midX , y:rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX , y:rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX , y:rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX , y:rect.minY))
        }
    }
}

struct Day74: View {
    @State var sliderValue:  Double = 0
    @State var tStroke:CGFloat = 0
    @State var tWidth: CGFloat = 200
    @State var tHeight: CGFloat = 200
    
    @State var rEnabled: Bool = false
    @State var wEnabled: Bool = false
    @State var hEnabled: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                
                Triangle()
                    .frame(width: tWidth,height: tHeight)
                    .foregroundColor(.orange)
                    .padding()
                    .overlay{
                        Triangle()
                            .stroke(style: StrokeStyle(lineWidth: tStroke,lineCap: .round))
                        
                        .frame(width: tWidth,height: tHeight)
                        
                    }
                    
                
                Spacer()
                
                VStack(alignment: .leading,spacing: 5){
                    VStack(alignment: .leading){
                        HStack{
                            Text("Width")
                                .foregroundColor(Color.gray)
                                .bold()
                            Text("\(Int(tWidth))")
                                .foregroundColor(Color.orange)
                                .bold()
                        }
                        Slider(value: $tWidth, in: 30...300) { _ in
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
                    .tint(wEnabled ? Color.orange : Color("strcolor"))
                    
                    VStack(alignment: .leading,spacing: 5){
                        HStack{
                            Text("Height")
                                .foregroundColor(Color.gray)
                                .bold()
                            Text("\(Int(tHeight))")
                                .foregroundColor(Color.orange)
                                .bold()
                        }
                        Slider(value: $tHeight, in: 30...300){ _ in
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
                    .tint(hEnabled ? Color.orange : Color("strcolor"))
                    
                    VStack(alignment: .leading,spacing: 5){
                        HStack{
                            Text("Stroke")
                                .foregroundColor(Color.gray)
                                .bold()
                            Text("\(Int(tStroke))")
                                .foregroundColor(Color.orange)
                                .bold()
                        }
                        Slider(value: $tStroke, in: 0...300){ _ in
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
                    .tint(hEnabled ? Color.orange : Color("strcolor"))
                    
                    
                    
                    
                    
                }
              
                Spacer()
               
            }
            .navigationTitle("Edit Shape")
            .padding()
            .padding(.top,30)
        }
    }
}

struct Day74_Previews: PreviewProvider {
    static var previews: some View {
        Day74()
    }
}

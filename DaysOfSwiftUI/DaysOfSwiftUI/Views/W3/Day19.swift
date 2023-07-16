//  Day19.swift
//  24/6/23

import SwiftUI

struct Day19: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(maxWidth: .infinity , maxHeight: .infinity)
                .overlay{
                    LinearGradient(colors: [
                        Color("warmblue"),
                        Color(.white)
                    ], startPoint: .top, endPoint:.bottom)
                }
        
            
            VStack(spacing: 20){
               Text("Now")
                    .foregroundColor(.white)
                    .font(.system(size: 20,weight: .semibold , design: .default))
               WeatherIcon(size: 30, primaryColor: .white ,secondaryColor: .yellow)
                Text("30°")
                     .foregroundColor(.white)
                     .font(.system(size: 25,weight: .semibold , design: .default))
            }
            .background{
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.white.opacity(0.2))
                    .frame(width: 200,height: 200)
                
            }
        }.ignoresSafeArea()
        
    }
}

struct Day19_Previews: PreviewProvider {
    static var previews: some View {
        Day19()
    }
}

struct WeatherIcon: View {
    
    @State var size: CGFloat
    @State var primaryColor: Color
    @State var secondaryColor: Color
    
    var body: some View {
        
        Image(systemName: "cloud.sun.fill")
            .symbolRenderingMode(.palette)
            .font(.system(size: size))
            .foregroundStyle(primaryColor , secondaryColor)
            }
    }


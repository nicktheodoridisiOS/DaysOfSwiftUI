//  Day61.swift
//  5/8/23

import SwiftUI

struct Day61: View {
    
    func getDistance(geometry: GeometryProxy) -> Double{
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentXPos = geometry.frame(in: .global).midX
        return Double(1-(currentXPos / maxDistance))
    }
    
    var body: some View {
        NavigationView{
            ScrollView(.horizontal , showsIndicators: false){
                HStack(spacing: 0){
                    ForEach(0..<20){ index in
                        GeometryReader{ geometry in
                            RoundedRectangle(cornerRadius: 10)
                                
                                .foregroundColor(.orange)
                                .rotation3DEffect(
                                    Angle(degrees: getDistance(geometry: geometry) * 50), axis: (x: 0.0, y: 1.0, z: 0.0))
                        }
                        .frame(width: 200,height: 200)
                        .padding()
                        .padding(.horizontal)
                        
                    }
                    
                }
                .navigationTitle("Carousel")
                .padding(.top,30)
                Spacer()
            }
        }
    }
}

struct Day61_Previews: PreviewProvider {
    static var previews: some View {
        Day61()
    }
}

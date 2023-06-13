//  Day8.swift
//  12/6/23

import SwiftUI
import MapKit

struct Day8: View {
    
    @State private var mapRegion: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.607641, longitude: 22.965325), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
    var body: some View {
        ZStack{
            Map(coordinateRegion: $mapRegion).ignoresSafeArea()
            Image("profile")
                .resizable()
                .frame(width: 40 , height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 60))
                .background{
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 45,height: 45)
                        .background{
                            Circle()
                                .foregroundColor(.green.opacity(0.3))
                                .frame(width: 95,height: 95)
                        }
                }
    
                
        }
        
    }
}

struct Day8_Previews: PreviewProvider {
    static var previews: some View {
        Day8()
    }
}

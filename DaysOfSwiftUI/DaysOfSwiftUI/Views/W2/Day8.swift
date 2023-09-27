//  Day8.swift
//  13/6/23

import SwiftUI
import MapKit

struct Day8: View {
    @State  private var cameraPosition: MapCameraPosition = .region(.myRegion)
   
    var body: some View {
        ZStack{
            Map(position: $cameraPosition).ignoresSafeArea()
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

extension CLLocationCoordinate2D{
    static var myLocation: CLLocationCoordinate2D{
        return .init(latitude: 40.607641, longitude: 22.965325)
    }
}

extension MKCoordinateRegion{
    static var myRegion: MKCoordinateRegion{
        return .init(center: .myLocation , latitudinalMeters: 10000,longitudinalMeters: 10000)
    }
}

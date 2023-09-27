//  Day21.swift
//  26/6/23

import SwiftUI
import MapKit

struct Day21: View {
    
    @State  private var newCameraPosition: MapCameraPosition = .region(.myNewRegion)
    
    @State var isLoading: Bool = false
    @State var buttonColor: Color = Color.accentColor
    @State var textButtonColor: Color = Color.white

    
    var body: some View {
        ZStack{
           
            if(isLoading){
                Map(position: $newCameraPosition).ignoresSafeArea()
            }
            VStack{
                Button {
                    isLoading.toggle()
                    if(isLoading){
                        buttonColor = Color.primary
                        textButtonColor = Color.accentColor
                       
                    }
                    else{
                        buttonColor = Color.accentColor
                        textButtonColor = Color.primary
             
                    }
                    
                } label: {
                    Image(systemName: "map")
                        .font(.title)
                        .foregroundColor(textButtonColor)
                        .background{
                            Circle()
                                .frame(width: 60,height: 60)
                                .foregroundColor(buttonColor)
                        }
                    
                }
                .padding()
            }.frame(maxWidth: .infinity , maxHeight: .infinity , alignment: .bottom)
                .padding()
                
                
            
            
            

        }
    }
}

struct Day21_Previews: PreviewProvider {
    static var previews: some View {
        Day21()
    }
}

extension CLLocationCoordinate2D{
    static var myNewLocation: CLLocationCoordinate2D{
        return .init(latitude: 40.607641, longitude: 22.965325)
    }
}

extension MKCoordinateRegion{
    static var myNewRegion: MKCoordinateRegion{
        return .init(center: .myLocation , latitudinalMeters: 10000,longitudinalMeters: 10000)
    }
}

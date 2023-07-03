//  Day27.swift
//  2/7/23

import SwiftUI

struct Day27: View {
    
    @State var showAlert: Bool = false
    
    var body: some View {
        Button(action: {
            showAlert.toggle()
        }, label: {
            Text("Location Details")
                .foregroundColor(.primary)
                .bold()
                .background{
                    Capsule()
                        .foregroundColor(.orange)
                        .frame(width:150 ,height: 40)
                }
        })
        .alert(isPresented: $showAlert) {
           getAlert()
        }
    }
    
    
    func getAlert() -> Alert{
        return Alert(
            title: Text("Current Location Not Available"),
            message: Text("Your current location can’t be " +
            "determined at this time.")
            
        )
    }
}

struct Day27_Previews: PreviewProvider {
    static var previews: some View {
        Day27()
    }
}

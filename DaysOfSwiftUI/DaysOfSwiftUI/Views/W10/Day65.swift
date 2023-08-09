//  Day65.swift
//  9/8/23

import SwiftUI
import UserNotifications


class NotificationManager{
    
    static let instance  = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert , .sound , .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options){ (success,error) in
            
            if let error = error{
                print("Error: \(error)")
            }else{
                print("Success")
            }
            
        }
    }
    
    func scheduleNotification(){
        
        let content = UNMutableNotificationContent()
        content.title = "100 Days Of SwiftUI"
        content.subtitle = "This is the 65th day! 🎉"
        content.sound = .default
        content.badge = 1
        
        let trigger  = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        let request  = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}

struct Day65: View {
    var body: some View {
        HStack(spacing: 10){
            Button("Send Me Notification"){
                NotificationManager.instance.scheduleNotification()
            }.buttonStyle(.bordered)
                .tint(.blue)
            
            Button(action: {
                UIApplication.shared.applicationIconBadgeNumber = 0
            }, label: {
                Text("Clear")
            }).buttonStyle(.bordered)
                .tint(.orange)
        }
    }
}

struct Day65_Previews: PreviewProvider {
    static var previews: some View {
        Day65()
    }
}

//
//  Alerts.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 27/8/23.
//

import SwiftUI


struct AlertItem: Identifiable{
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext{
    static let humanWin = AlertItem(title:Text("Congratulations"),
                             message: Text("You won! 🎉 What an impressive victory!"),
                             buttonTitle: Text("Play Again"))
    
    static let aiWin = AlertItem(title:Text("Game Over"),
                             message: Text("You lost! 😔 The AI outsmarted you this time. Keep practicing and you'll improve!"),
                             buttonTitle: Text("Try Again"))
    
    static let draw = AlertItem(title:Text("It's a Draw"),
                             message: Text("The game ended in a draw. 🤝 A well-fought match!"),
                             buttonTitle: Text("Play Again"))
}

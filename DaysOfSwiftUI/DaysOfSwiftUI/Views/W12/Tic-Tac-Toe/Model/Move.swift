//
//  File.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 1/9/23.
//

import Foundation
import SwiftUI


enum Player{
    case human ,ai
}

struct Move{
    let player: Player
    let boardIndex: Int
    
    var indicator: some View{
        return player == .human
        ? AnyView(XIndicatorView())
        : AnyView(YIndicatorView())
        
    }
}

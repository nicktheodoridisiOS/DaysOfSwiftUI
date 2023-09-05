//
//  AgainstViewModel.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 4/9/23.
//

import SwiftUI

import SwiftUI

final class AgainstViewModel: ObservableObject{
    
    @Published var amoves: [Move?] = Array(repeating: nil, count: 9)
    @Published var firstPlayerTurn: Bool  = true
    @Published var alertItem: AlertItem?
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    func gameProcess(for position: Int , roundSelectedOption: Int){
        
        if isSquareOccupied(in: amoves, forIndex: position) {return}
        amoves[position] = Move(player: firstPlayerTurn ? .firstPlayer : .secondPlayer, boardIndex: position)
        
        
        if checkWinCondition(for: .firstPlayer, in: amoves){
            alertItem = AlertContext.firstPlayerWin
            
        }
        
        if checkWinCondition(for: .secondPlayer, in: amoves){
            alertItem = AlertContext.secondPlayerWin
            
        }
        
        if(checkForDraw(in: amoves)){
            alertItem = AlertContext.draw
        }
        
        firstPlayerTurn.toggle()
    }
    
    func isSquareOccupied(in moves: [Move?], forIndex index: Int ) -> Bool{
        return moves.contains(where: {$0?.boardIndex == index})
    }
    func checkWinCondition(for player: Player,in moves: [Move?]) -> Bool {
        let winPatterns: Set<Set<Int>> = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
        
        let playerMoves = moves.compactMap{$0}.filter{ $0.player == player} // Removing nil from array and keep the player's move array's index
        
        let playerPosition = Set(playerMoves.map{$0.boardIndex}) // Give me the board indexed from player's array
        
        for pattern in winPatterns where pattern.isSubset(of: playerPosition){ return true }
        //check if a win condition existing from winPatterns and matches with playerPosition
        
        return false
    }
    
    func checkForDraw(in moves: [Move?]) -> Bool {
        return moves.compactMap{$0}.count == 9
    }
    
    func resetGame(){
        amoves = Array(repeating: nil, count: 9)
    }
    
}

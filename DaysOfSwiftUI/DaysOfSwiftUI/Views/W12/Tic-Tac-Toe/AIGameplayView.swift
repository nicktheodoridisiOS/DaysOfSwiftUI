//
//  AIGameplayView.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 23/8/23.
//

import SwiftUI

struct AIGameplayView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var moves: [Move?] = Array(repeating: nil, count: 9)
    @State private var isGameBoardDisabled: Bool  = false
    
    //Animation Stater
    @State private var gridScaleAmount: CGFloat = 0
    
    @State private var alertItem: AlertItem?
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Spacer()
                LazyVGrid(columns: columns,spacing: 10 ){
                    ForEach(0..<9){ i in
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(isSquareOccupied(in: moves, forIndex: i) ? Color.gray.opacity(0) : Color.gray.opacity(0.1))
                                .frame(width: geometry.size.width/3 - 50, height: geometry.size.width/3 - 50)
                            
                            moves[i]?.indicator
                            
                        }
                        .scaleEffect(gridScaleAmount)
                        .onTapGesture{
                            if(isSquareOccupied(in: moves, forIndex: i)) {return}
                            moves[i] = Move(player: .human, boardIndex: i)
                            
                            
                            // Win / Draw Condition
                            
                            if checkWinCondition(for: .human, in: moves){
                                alertItem = AlertContext.humanWin
                                return
                            }
                            
                            if checkForDraw(in: moves){
                                alertItem = AlertContext.draw
                                return
                            }
                            
                            isGameBoardDisabled = true

                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                let aiPosition = determineMovePosition(in: moves)
                                moves[aiPosition] = Move(player: .ai, boardIndex: aiPosition)
                                isGameBoardDisabled = false
                                
                                if checkWinCondition(for: .ai, in: moves){
                                    alertItem = AlertContext.aiWin
                                    return
                                }
                                
                                if checkForDraw(in: moves){
                                    alertItem = AlertContext.draw
                                    return
                                }
                                
                            }
                            
                        }
                        .onAppear{
                            withAnimation(.spring()){
                                gridScaleAmount = 1
                            }
                        }
                    }
                }
                Spacer()
            }
            .disabled(isGameBoardDisabled)
            .padding()
            .padding(.horizontal,50)
            .alert(item: $alertItem, content: { alertItem in
                Alert(title: alertItem.title ,
                      message: alertItem.message ,
                      dismissButton: .default(alertItem.buttonTitle,action: {resetGame()}))
            })
        }
    }
    
    func isSquareOccupied(in moves: [Move?], forIndex index: Int ) -> Bool{
        return moves.contains(where: {$0?.boardIndex == index})
    }
    
    
    func determineMovePosition(in moves: [Move?]) -> Int{
        let winPatterns: Set<Set<Int>> = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
        
       
        //Easy Mode
        let aiMoves = moves.compactMap{$0}.filter{ $0.player == .ai} // Removing nil from array and keep the player's move array's index
        let aiPosition = Set(aiMoves.map{$0.boardIndex}) // Give me the board indexed from player's array
        
        for pattern in winPatterns {
            let  winPosition = pattern.subtracting(aiPosition)
            
            if winPosition.count == 1 {
                let isAvailable = !isSquareOccupied(in: moves, forIndex: winPosition.first!)
                if isAvailable {return winPosition.first!}
            }
        }
        
        //Medium Mode
        let humanMoves = moves.compactMap{$0}.filter{ $0.player == .human} // Removing nil from array and keep the player's move array's index
        let humanPosition = Set(humanMoves.map{$0.boardIndex}) // Give me the board indexed from player's array
        
        for pattern in winPatterns {
            let  winPosition = pattern.subtracting(humanPosition)
            
            if winPosition.count == 1 {
                let isAvailable = !isSquareOccupied(in: moves, forIndex: winPosition.first!)
                if isAvailable {return winPosition.first!}
            }
        }
        
        //Hard Mode
        let centerSquare = 4
        if !isSquareOccupied(in: moves, forIndex: centerSquare){
            return centerSquare
        }
        
    
        
        
        var movePosition = Int.random(in: 0..<9)
        
        while isSquareOccupied(in: moves, forIndex: movePosition){
            movePosition = Int.random(in: 0..<9)
        }
        
        return movePosition
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
        moves = Array(repeating: nil, count: 9)
    }
    
    
}

enum Player{
    case human , ai
}

struct Move{
    let player: Player
    let boardIndex: Int
    
    var indicator: some View{
        return player == .human
        ? AnyView(XIndicator())
        : AnyView(YIndicator())
        
    }
}

struct XIndicator:View{
    
    //Animation Stater
    @State private var indicatorScaleAmount: CGFloat = 0
    
    var body: some View{
        ZStack{
            Image(systemName: "xmark" )
                .foregroundColor(.blue)
                .font(.system(size: 40,weight: .semibold))
                .scaleEffect(indicatorScaleAmount)
                .background{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.blue.opacity(0.15))
                        .frame(width: 80,height: 80)
                }
        }
        .onAppear{
            withAnimation(.spring(response: 0.2)){
                indicatorScaleAmount = 1
            }
        }
    }
}

struct YIndicator: View{
    //Animation Stater
    @State private var indicatorScaleAmount: CGFloat = 0
    
    var body: some View{
        ZStack {
            Image(systemName: "circle" )
                .font(.system(size: 40,weight: .bold))
                .foregroundColor(.yellow)
                .scaleEffect(indicatorScaleAmount)
                .background{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.yellow.opacity(0.15))
                        .frame(width: 80,height: 80)
            }
        }
        .onAppear{
            withAnimation(.spring(response: 0.2)){
                indicatorScaleAmount = 1
            }
        }
    }
}

struct AIGameplayView_Previews: PreviewProvider {
    static var previews: some View {
        AIGameplayView()
    }
}

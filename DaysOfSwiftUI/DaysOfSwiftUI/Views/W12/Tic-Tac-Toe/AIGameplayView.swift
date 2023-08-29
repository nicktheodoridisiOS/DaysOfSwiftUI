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
    @State private var humanTurn: Bool  = false
    @State private var aiTurn: Bool  = false
    
    //Animation Stater
    @State private var gridScaleAmount: CGFloat = 0
    
    @State private var alertItem: AlertItem?
    
    @State private var totalRounds = 5
    @State private var currentRound = 0
    @State private var humanScore = 0
    @State private var aiScore = 0
    
    
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                HStack(spacing:0){
                    VStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(humanTurn ? .accentColor.opacity(0.15) : .gray.opacity(0.1))
                            .frame(width: 70,height:100)
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(humanTurn ? Color.accentColor : .gray.opacity(0.1))
                                    .frame(width: 70,height: 100)
                                    .overlay{
                                        VStack(spacing: 10){
                                            Image(systemName: "person.fill")
                                                .font(.largeTitle)
                                                .foregroundColor(humanTurn ? .accentColor : .gray.opacity(0.1))
                                            Text("You")
                                                .fontWeight(.semibold)
                                                .foregroundColor(humanTurn ? .accentColor : .gray.opacity(0.1))
                                        }
                                    }
                            }
                    }
                    VStack(spacing: 15){
                        Text("\(humanScore) : \(aiScore)")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                        Text(currentRound == 4 ? "Last Round":"Round \(currentRound+1)")
                            .foregroundColor(currentRound == 4 ? .red.opacity(0.5) : .secondary.opacity(0.5))
                            .font(.system(size: currentRound == 4 ? 8 : 11))
                            .background{
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundColor(currentRound == 4 ? .red.opacity(0.2) : .secondary.opacity(0.2))
                                    .frame(width: 55,height:20)
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(currentRound == 4 ? .red.opacity(0.5) : .secondary.opacity(0.5))
                                            .frame(width: 55,height:20)
                                    }
                            }
                        
                    }
                    .padding(.horizontal,25)
                    
                    VStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(aiTurn ? .yellow.opacity(0.15) : .gray.opacity(0.1))
                            .frame(width: 70,height:100)
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(aiTurn ? .yellow: .gray.opacity(0.1))
                                    .frame(width: 70,height: 100)
                                    .overlay{
                                        VStack(spacing: 10){
                                            Image(systemName: "poweroutlet.type.f.fill")
                                                .font(.largeTitle)
                                                .foregroundColor(aiTurn ? .yellow : .gray.opacity(0.1))
                                            Text("AI")
                                                .fontWeight(.semibold)
                                                .foregroundColor(aiTurn ? .yellow : .gray.opacity(0.1))
                                        }
                                    }
                            }
                    }
                }
                
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
                            aiTurn = true
                            humanTurn = false
                            if(isSquareOccupied(in: moves, forIndex: i)) {return}
                            moves[i] = Move(player: .human, boardIndex: i)
                            
                            print(currentRound)
                            print(humanScore)
                            print(aiScore)
                            
                            // Win / Draw Condition
                            
                            if checkWinCondition(for: .human, in: moves){
                                humanScore = humanScore + 1
                                currentRound = currentRound + 1
                                alertItem = AlertContext.humanRound
                                if(totalRounds == currentRound){
                                    if(humanScore > aiScore){
                                        alertItem = AlertContext.humanWin
                                        resetScore()
                                    }
                                    else if(humanScore < aiScore){
                                        alertItem = AlertContext.aiWin
                                        resetScore()
                                    }
                                    else{
                                        alertItem = AlertContext.draw
                                        resetScore()
                                    }
                                }
                                return
                            }
                            
                            
                            if checkForDraw(in: moves){
                                currentRound = currentRound + 1
                                alertItem = AlertContext.drawRound
                                if(totalRounds == currentRound){
                                    if(humanScore > aiScore){
                                        alertItem = AlertContext.humanWin
                                        resetScore()
                                    }
                                    else if(humanScore < aiScore){
                                        alertItem = AlertContext.aiWin
                                        resetScore()
                                    }
                                    else{
                                        alertItem = AlertContext.draw
                                        resetScore()
                                    }
                                }
                                return
                            }
                            
                            isGameBoardDisabled = true
                            
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                let aiPosition = determineMovePosition(in: moves)
                                moves[aiPosition] = Move(player: .ai, boardIndex: aiPosition)
                                isGameBoardDisabled = false
                                
                                
                                if checkWinCondition(for: .ai, in: moves){
                                    aiScore = aiScore + 1
                                    currentRound = currentRound + 1
                                    alertItem = AlertContext.aiRound
                                    if(totalRounds == currentRound){
                                        if(humanScore > aiScore){
                                            alertItem = AlertContext.humanWin
                                            resetScore()
                                        }
                                        else if(humanScore < aiScore){
                                            alertItem = AlertContext.aiWin
                                            resetScore()
                                        }
                                        else{
                                            alertItem = AlertContext.draw
                                            resetScore()
                                        }
                                    }
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
                            aiTurn = false
                            humanTurn = true
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
    
    func resetScore(){
        humanScore = 0
        aiScore = 0
        currentRound = 0
    }
    
    func determineMovePosition(in moves: [Move?]) -> Int{
        let winPatterns: Set<Set<Int>> = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
        
        aiTurn.toggle()
        humanTurn.toggle()
        
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
        humanTurn.toggle()
        aiTurn.toggle()
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

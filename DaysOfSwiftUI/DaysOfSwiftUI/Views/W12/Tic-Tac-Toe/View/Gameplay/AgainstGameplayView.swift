//
//  MultiplayerGamePlayView.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 3/9/23.
//

import SwiftUI

struct AgainstGameplayView: View {
    @StateObject private var againstViewModel = AgainstViewModel()
    
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Spacer()
                LazyVGrid(columns: againstViewModel.columns,spacing: 10 ){
                    ForEach(0..<9){ i in
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(Color.gray.opacity(0.1))
                                .frame(width: geometry.size.width/3 - 50, height: geometry.size.width/3 - 50)
                            
                            againstViewModel.amoves[i]?.indicator
                        }
                        .onTapGesture {
                            if againstViewModel.isSquareOccupied(in: againstViewModel.amoves, forIndex: i) {return}
                            
                            againstViewModel.amoves[i] = Move(player: againstViewModel.firstPlayerTurn ? .firstPlayer : .secondPlayer, boardIndex: i)
                            
                                
                            if againstViewModel.checkWinCondition(for: .firstPlayer, in: againstViewModel.amoves){
                                print("First Player Win")
                                
                            }
                            
                            if againstViewModel.checkWinCondition(for: .secondPlayer, in: againstViewModel.amoves){
                                print("Second Player Win")
                                
                            }
                            
                            if(againstViewModel.checkForDraw(in: againstViewModel.amoves)){
                                print("Draw")
                                
                            }
                            
                            
                            againstViewModel.firstPlayerTurn.toggle()
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .padding(.horizontal,50)
        }
    }
}

struct AgainstGameplayView_Previews: PreviewProvider {
    static var previews: some View {
        AgainstGameplayView()
    }
}

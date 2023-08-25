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
    @State private var isHumansTurn = true
    
    //Animation Stater
    @State private var gridScaleAmount: CGFloat = 0
    
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
                            moves[i] = Move(player: isHumansTurn ? Player.human : Player.ai, boardIndex: i)
                            isHumansTurn.toggle()
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
            .padding()
            .padding(.horizontal,50)
        }
    }
    
    func isSquareOccupied(in moves: [Move?], forIndex index: Int ) -> Bool{
        return moves.contains(where: {$0?.boardIndex == index})
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

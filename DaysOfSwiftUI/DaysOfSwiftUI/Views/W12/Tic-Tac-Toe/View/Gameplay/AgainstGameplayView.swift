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
                            againstViewModel.gameProcess(for: i, roundSelectedOption: 1)
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .padding(.horizontal,50)
            .alert(item: $againstViewModel.alertItem, content: { alertItem in
                Alert(title: alertItem.title ,
                      message: alertItem.message ,
                      dismissButton: .default(alertItem.buttonTitle,action: {againstViewModel.resetGame()}))
            })
        }
    }
}

struct AgainstGameplayView_Previews: PreviewProvider {
    static var previews: some View {
        AgainstGameplayView()
    }
}

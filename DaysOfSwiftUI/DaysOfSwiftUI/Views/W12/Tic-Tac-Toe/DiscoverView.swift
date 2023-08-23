//
//  DiscoverView.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 21/8/23.
//

import SwiftUI


struct DiscoverView: View {
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                VStack(spacing: 30){
                    Image("tictactoeCover")
                        .resizable()
                        .scaledToFit()
                    VStack(alignment: .leading, spacing: 5){
                        Text("WHAT IS TIC TAC TOE")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("Tic-tac-toe, also known as noughts and crosses, is a strategy game typically played by two players taking turns to place their symbols (usually 'X' or 'O') on a 3x3 grid.")
                            .font(.system(size: 17))
                    }
                    .frame(maxWidth: .infinity,alignment:.topLeading)
                    .padding(.horizontal,30)
                    VStack(alignment: .leading, spacing: 5){
                        Text("RULES")
                            .font(.headline)
                            .fontWeight(.semibold)
                        HStack(alignment:.top){
                            Text("•")
                            VStack(alignment: .leading, spacing: 0){
                                Text("The first player usually uses 'X' while the second player uses 'O'")
                            }
                        }
                        .padding(.horizontal)
                        HStack(alignment:.top){
                            Text("•")
                            VStack(alignment: .leading, spacing: 0){
                                Text("Players take alternating turns to place their symbol on the grid, starting with the first player.")
                            }
                        }
                        .padding(.horizontal)
                        HStack(alignment:.top){
                            Text("•")
                            VStack(alignment: .leading, spacing: 0){
                                Text("The goal is to create a sequence of three identical symbols (either 'X' or 'O') horizontally, vertically, or diagonally.")
                            }
                        }
                        .padding(.horizontal)
                        HStack(alignment:.top){
                            Text("•")
                            VStack(alignment: .leading, spacing: 0){
                                Text("If the grid fills up without a winner, the game is considered a draw.")
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(maxWidth: .infinity,alignment:.topLeading)
                    .padding(.horizontal,30)
                    VStack(alignment:.leading , spacing: 15){
                        Text("APPLICATION CONTENT")
                            .font(.headline)
                            .fontWeight(.semibold)
                        HStack(alignment:.center,spacing: 9){
                            VStack(spacing: 10){
                                Image("ai")
                                    .resizable()
                                    .scaledToFit()
                                Text("Play With AI")
                                    .font(.system(size: 12,weight: .semibold))
                            }
                            VStack(spacing: 10){
                                Image("multiplayer")
                                    .resizable()
                                    .scaledToFit()
                                Text("Multiplayer")
                                    .font(.system(size: 12,weight: .semibold))
                            }
                            VStack(spacing: 10){
                                Image("customize")
                                    .resizable()
                                    .scaledToFit()
                                Text("Customize")
                                    .font(.system(size: 12,weight: .
                                                 semibold))
                            }
                        }
                        Spacer(minLength: 30)
                        
                    }
                    .frame(maxWidth: .infinity,alignment:.topLeading)
                    .padding(.horizontal,30)
                    
                }
            }
            .navigationTitle("Discover")
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}

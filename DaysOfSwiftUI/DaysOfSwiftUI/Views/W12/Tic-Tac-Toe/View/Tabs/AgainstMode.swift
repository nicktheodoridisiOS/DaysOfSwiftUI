//
//  FriendView.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 21/8/23.
//

import SwiftUI

struct AgainstMode: View {
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                VStack(spacing: 30){
                    Image("mpcover")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal)
                        .padding(.top)
                    VStack(alignment: .leading, spacing: 5){
                        Text("ABOUT AGAINST MODE")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.red)
                        Text("Get ready for the continuous suspense and thrill of the waiting as you enter the world of Tic-Tac-Toe.Have fun and good luck in conquering Tic-Tac-Toe before your friend!")
                            .font(.system(size: 17))
                    }
                    .frame(maxWidth: .infinity,alignment:.topLeading)
                    .padding(.horizontal)
                    
                    Spacer()
                    NavigationLink(destination: AgainstGameplayView(), label: {
                        HStack{
                            Image(systemName: "person.2.fill")
                            Text("Play Against")
                                
                                
                        }
                       
                        
                    })
                    .buttonStyle(.bordered)
                    .tint(.red)
                    
                    
                }
                
            }
            .navigationTitle("Against Mode")
            
        }
        
    }
}

struct MultiplayerView_Previews: PreviewProvider {
    static var previews: some View {
        AgainstMode()
    }
}

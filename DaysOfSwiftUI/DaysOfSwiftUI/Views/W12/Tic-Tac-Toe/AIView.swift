//
//  AIView.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 21/8/23.
//

import SwiftUI

struct AIView: View {
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                VStack(spacing: 30){
                    Image("AICover")
                        .resizable()
                        .scaledToFit()
                    VStack(alignment: .leading, spacing: 5){
                        Text("ABOUT AI")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("Artificial Intelligence (AI) is a field of computer science that deals with the design and development of systems capable of performing tasks that require human intelligence. The AI of this application (Tic Tac Toe) has been programmed to face any human intelligence. Are you capable of facing it?")
                            .font(.system(size: 17))
                    }
                    .frame(maxWidth: .infinity,alignment:.topLeading)
                    .padding(.horizontal,30)
                    
                    Spacer()
                    NavigationLink(destination: AIGameplayView(), label: {
                        HStack{
                            Image(systemName: "poweroutlet.type.f.fill")
                            Text("Play With AI")
                                
                                
                        }
                       
                        
                    })
                    .buttonStyle(.bordered)
                    .tint(.yellow)
                    
                    
                }
                
            }
            .navigationTitle("Play With AI")
            
        }
        
    }
}


struct AIView_Previews: PreviewProvider {
    static var previews: some View {
        AIView()
    }
}

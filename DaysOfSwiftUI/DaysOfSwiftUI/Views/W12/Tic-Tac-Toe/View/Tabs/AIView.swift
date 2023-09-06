//
//  AIView.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 21/8/23.
//

import SwiftUI

struct AIView: View {
    
    @Binding var firstNamePlayerTf: String
    @Binding var roundSelectedOption: Int
    
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                VStack(spacing: 30){
                    Image("aicover")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal)
                        .padding(.top)
                    VStack(alignment: .leading, spacing: 5){
                        Text("ABOUT AI MODE")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.yellow)
                        Text("Artificial Intelligence (AI) is a field of computer science that deals with the design and development of systems capable of performing tasks that require human intelligence. The AI of this application (Tic Tac Toe) has been programmed to face any human intelligence. Are you capable of facing it?")
                            .font(.system(size: 17))
                    }
                    .frame(maxWidth: .infinity,alignment:.topLeading)
                    .padding(.horizontal)
                    
                    Spacer()
                    NavigationLink(destination: AIGameplayView(firstNamePlayerTf: $firstNamePlayerTf,roundSelectedOption: $roundSelectedOption), label: {
                        HStack{
                            Image(systemName: "poweroutlet.type.f.fill")
                            Text("Play Against AI")
                                
                                
                        }
                       
                        
                    })
                    .buttonStyle(.bordered)
                    .tint(.yellow)
                    
                    
                }
                
            }
            .navigationTitle("AI Mode")
            
        }
        
    }
}


struct AIView_Previews: PreviewProvider {
    static var previews: some View {
        AIView(firstNamePlayerTf: .constant(""),roundSelectedOption: .constant(0))
    }
}

//  Day28.swift
//  3/7/23

import SwiftUI

struct Day28: View {
    
    @State var showActionSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 10){
            HStack{
                HStack(spacing: 0){
                    
                    Image("igProfile")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .clipShape(Circle())
                        .padding()
                    
                    VStack(alignment: .leading){
                        Text("nickmadethisone")
                            .font(.system(size: 15, weight: .bold,design: .default))
                        Text("Thessalonikki,Greece")
                            .font(.system(size: 15, weight: .regular,design: .default))
                    }
                    
                }
                Spacer()
                Button(action: {
                    showActionSheet.toggle()
                }, label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.primary)
                })
                .confirmationDialog("Edit", isPresented: $showActionSheet, titleVisibility: .automatic){
                    Button("Share"){
                        
                    }
                    Button("Report",role: .destructive){
                        
                    }
                } message: {
                    Text("What would you like to do?")
                }
                .padding(.horizontal)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding(.top)
    }
    
    
    struct Day28_Previews: PreviewProvider {
        static var previews: some View {
            Day28()
        }
    }
}

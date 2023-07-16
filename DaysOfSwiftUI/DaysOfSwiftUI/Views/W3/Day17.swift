//  Day17.swift
//  22/6/23

import SwiftUI

struct Day17: View {
    var body: some View {

            VStack{
                Text("Tasks")
                    .font(.system(size: 45,weight: .semibold , design: .default))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity , alignment: .topLeading)
                    .padding()
                    .padding(.top,15)
                Spacer()
                Text("Tap + to add a task.")
                    .font(.system(size: 15,weight: .semibold , design: .default))
                    .foregroundColor(.secondary)
                Spacer()
                Button(action: {
                    
                }, label: {
                    Circle()
                        .foregroundColor(.orange)
                        .shadow(radius: 30)
                        .frame(width: 70,height: 70)
                        .overlay{
                            Image(systemName: "plus")
                                .font(.system(size: 30 , design: .default))
                                .foregroundColor(.white)
                        }
                })
                .frame(maxWidth: .infinity , alignment: .bottomTrailing)
                .padding()
                
                
            }
    }
}

struct Day17_Previews: PreviewProvider {
    static var previews: some View {
        Day17()
    }
}

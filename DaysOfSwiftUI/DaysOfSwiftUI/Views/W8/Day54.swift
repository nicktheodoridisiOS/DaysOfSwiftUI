//  Day54.swift
//  29/7/23

import SwiftUI

struct Day54: View {
    
    @State var showSheet:Bool = false
    
    var body: some View {
        NavigationStack{
            List(0..<25){ _ in
                Spacer()
            }
            .navigationTitle("List")
            .safeAreaInset(edge: .bottom,alignment: .leading){
                Image(systemName: "plus")
                    .foregroundColor(.primary)
                    .padding()
                    .background(.orange)
                    .clipShape(Circle())
                    .padding(.bottom,20)
                    .padding(.horizontal,30)
                    .onTapGesture {
                        showSheet = true
                    }
                    .sheet(isPresented: $showSheet) {
                        EmptyView()
                            .presentationDetents([.medium , .large])
                            .presentationDragIndicator(.hidden)
                    }
            }
        }
    }
}

struct Day54_Previews: PreviewProvider {
    static var previews: some View {
        Day54()
    }
}

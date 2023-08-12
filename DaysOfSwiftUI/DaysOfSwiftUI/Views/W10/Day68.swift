//  Day68.swift
//  12/8/23

import SwiftUI

struct Day68: View {
    
    @StateObject var verifiedUsersViewModel =  VeridiedUsersViewModel()
    @State var searchText: String = ""
    @State var isFiltered: Bool = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                Button {
                    isFiltered.toggle()
                } label: {
                    Text(isFiltered ? "Verified" : "Non Verify")
                        .foregroundColor(isFiltered ? .accentColor : .primary)
                }.buttonStyle(.bordered)
                    .frame(maxWidth: .infinity , alignment:.topLeading)
                    .padding()
                
                VStack{
                    if(!isFiltered){
                        ForEach(verifiedUsersViewModel.verifiedUsers){
                            user in
                            HStack(spacing: 20){
                                Circle()
                                    .foregroundColor(.secondary.opacity(0.1))
                                    .frame(width:50)
                                HStack{
                                    Text(user.name)
                                        .font(.callout)
                                    if user.isVerified{ Image(systemName: "checkmark.seal.fill")
                                            .foregroundColor(.accentColor)
                                            .font(.caption2)
                                    }
                                }
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Text("Following")
                                }.buttonStyle(.bordered)
                                Image(systemName: "ellipsis")
                                    .font(.callout)
                            }
                        }
                    }
                    else{
                        ForEach(verifiedUsersViewModel.filteredVerifiedUsers){
                            user in
                            HStack(spacing: 20){
                                Circle()
                                    .foregroundColor(.secondary.opacity(0.1))
                                    .frame(width:50)
                                HStack{
                                    Text(user.name)
                                        .font(.callout)
                                    if user.isVerified{ Image(systemName: "checkmark.seal.fill")
                                            .foregroundColor(.accentColor)
                                            .font(.caption2)
                                    }
                                }
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Text("Following")
                                }.buttonStyle(.bordered)
                                Image(systemName: "ellipsis")
                                    .font(.callout)
                                
                                
                                
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top,5)
            }
            .searchable(text: $searchText,prompt: "Search")
            .navigationTitle("Following")
            .tint(.accentColor)
            
        }
    }
    
    struct Day68_Previews: PreviewProvider {
        static var previews: some View {
            Day68()
        }
    }
}

//  Day67.swift
//  11/8/23


import SwiftUI

struct VerifiedUser: Identifiable{
    let id = UUID().uuidString
    let name: String
    let isVerified: Bool
}

class VeridiedUsersViewModel: ObservableObject{
    @Published var verifiedUsers: [VerifiedUser] = []
    @Published var filteredVerifiedUsers: [VerifiedUser] = []
    
    init(){
        getUsers()
        updateFilteredVerifyUsers()
    }
    
    func getUsers(){
        let user1  = VerifiedUser(name: "mojombo",isVerified: true)
        let user2  = VerifiedUser(name: "defunkt",isVerified: true)
        let user3  = VerifiedUser(name: "pjhyett",isVerified: false)
        let user4  = VerifiedUser(name: "wycats",isVerified: false)
        let user5  = VerifiedUser(name: "ezmobius",isVerified: true)
        let user6  = VerifiedUser(name: "ezmobius",isVerified: false)
        let user7  = VerifiedUser(name: "evanphx",isVerified: true)
        self.verifiedUsers.append(contentsOf: [user1,user2,user3,user4,user5,user6,user7])
    }
    
    func updateFilteredVerifyUsers(){
        filteredVerifiedUsers = verifiedUsers.sorted(by: {$0.name < $1.name})
    }
}

struct Day67: View {
    
    @StateObject var verifiedUsersViewModel =  VeridiedUsersViewModel()
    @State var searchText: String = ""
    @State var isSorted: Bool = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                Button {
        
                  isSorted.toggle()
                  
                } label: {
                    Text(isSorted ? "Sorted by Name" : "Sort by Name")
                        .foregroundColor(isSorted ? .accentColor : .primary)
                }.buttonStyle(.bordered)
                    .frame(maxWidth: .infinity , alignment:.topLeading)
                    .padding()

                VStack{
                    if(!isSorted){
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
    
    struct Day67_Previews: PreviewProvider {
        static var previews: some View {
            Day67()
        }
    }
}

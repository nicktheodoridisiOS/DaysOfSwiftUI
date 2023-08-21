//
//  Day77.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 20/8/23.
//

import SwiftUI
import Combine


final class UserManager{
    func getAllUsers() async throws -> [UserModel]{[
        UserModel(name: "Eden Sparks"),
        UserModel(name: "Emily Owens"),
        UserModel(name: "Liv Gates")]
        
    }
}

@MainActor
final class SearchableViewModel: ObservableObject{
    
    @Published private (set) var allUsers: [UserModel] = []
    @Published private (set) var filteredUsers: [UserModel] = []

    @Published var searchText: String = ""

    let manager = UserManager()
    
    private var cancellable = Set<AnyCancellable>()
    
    var isSearching: Bool{
        !searchText.isEmpty
    }
    
    init(){
        addUsers()
    }
    
    private func addUsers(){
        $searchText.debounce(for: 0.3, scheduler: DispatchQueue.main).sink{ [weak self]
            searchText in
            self?.filteredUsers(searchText: searchText)
        }
        .store(in: &cancellable)
    }
    
    private func filteredUsers(searchText: String){
        guard !searchText.isEmpty else{
            filteredUsers = []
            return
        }
        
        
        let search = searchText.lowercased()
        filteredUsers = allUsers.filter({user in
            let nameContainsSearch = user.name.lowercased().contains(search)
            return nameContainsSearch
        })
    }
    
    func loadUsers() async{
        try? await Task.sleep(nanoseconds:  3_000_000_000)
        do{
            allUsers = try await manager.getAllUsers()
        }
        catch{
            print(error)
        }
    }
}

struct Day77: View {
    
    @State private var scaleAmount: CGFloat = 0
    
    @StateObject private var viewModel =  SearchableViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    ForEach(viewModel.isSearching ? viewModel.filteredUsers : viewModel.allUsers,id: \.self){ user in
                        HStack(spacing: 10){
                            Circle()
                                .foregroundColor(.secondary.opacity(0.1))
                                .frame(width:50)
                            HStack{
                                Text(user.name)
                                    .font(.callout)
                            }
                            Spacer()
                            Button {
                                
                            } label: {
                                Text("Following")
                            }.buttonStyle(.bordered)
                            Image(systemName: "ellipsis")
                                .font(.callout)
                                .padding(.horizontal)
                        
                        

                        }
                        .scaleEffect(scaleAmount)
                        .padding(.horizontal)
                        .onAppear{
                            withAnimation(.spring()){
                                scaleAmount  = 1
                            }
                        }
                        
                    }
                }
            }
            .refreshable {
                await viewModel.loadUsers()
            
            }
            .searchable(text: $viewModel.searchText)
            .navigationTitle("Followers")
            .task {
                await viewModel.loadUsers()
            }
        }
    }
}

struct Day77_Previews: PreviewProvider {
    static var previews: some View {
        Day77()
    }
}

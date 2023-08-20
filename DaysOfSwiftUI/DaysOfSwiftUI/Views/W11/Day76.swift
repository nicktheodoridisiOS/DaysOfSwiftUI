//  Day76.swift
//  20/8/23

import SwiftUI

final class RefleshableDataServise{
    func getData() async throws -> [String]{
        try? await Task.sleep(nanoseconds:  3_000_000_000)
        let data: [UserModel] = [
            UserModel(name: "Eden Sparks"),
            UserModel(name: "Emily Owens"),
            UserModel(name: "Liv Gates")
        ]
        return data.map { $0.name }.shuffled()
    }
}

@MainActor
final class Day76ViewModel: ObservableObject{
    @Published private (set) var items: [String] = []
    let manager = RefleshableDataServise()
    
    func loadData() async   {
        do{
            items = try await manager.getData()
        }
        catch{
            print(error)
        }
    }
}

struct Day76: View {
    
    @StateObject private var viewModel = Day76ViewModel()
    
    @State private var search: String = ""
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    ForEach(viewModel.items,id: \.self){ user in
                        HStack(spacing: 10){
                            Circle()
                                .foregroundColor(.secondary.opacity(0.1))
                                .frame(width:50)
                            HStack{
                                Text(user)
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
                        .padding(.horizontal)
                        
                    }
                }
            }
            .searchable(text: $search)
            .refreshable {
                await viewModel.loadData()
            
            }
            .navigationTitle("Following")
            .task{
                await viewModel.loadData()
            }
            .tint(.accentColor)
            
        }
    }
}

struct Day76_Previews: PreviewProvider {
    static var previews: some View {
        Day76()
    }
}

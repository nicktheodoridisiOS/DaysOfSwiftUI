//  Day43.swift
//  18/7/23


import SwiftUI

class PlaylistViewModel: ObservableObject{
    @Published var dataArray: [String] = []
    
    init(){
        getData()
    }
    
    func getData(){
        self.dataArray.append(contentsOf: ["Note1" , "Note2" , "Note3","Note4"])
    }
}

struct Day43: View {
    
    @StateObject var playlist: PlaylistViewModel = PlaylistViewModel()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(playlist.dataArray,id: \.self){ item in
                    NavigationLink(destination: SecondView(selectedItem: item)) {
                        Text(item)
                    }
                    
                    
                }
            }
            .navigationTitle("Notes")
        }
        .environmentObject(playlist)
    }
}
    
    struct SecondView: View{
        
        @State var sheetIsOpened: Bool = false
        let selectedItem: String
        
        var body: some View{
            VStack{
                Button {
                    sheetIsOpened.toggle()
                } label: {
                    Text("Preview Notes")
                }
                .sheet(isPresented: $sheetIsOpened){
                    sheetView()
                }
            }.navigationTitle(selectedItem)
            
        }
    }
    
struct sheetView: View{
    
    @EnvironmentObject var playlist: PlaylistViewModel
    
    
    var body: some View{
        NavigationView{
            VStack{
                List{
                    ForEach(playlist.dataArray , id: \.self){ item in
                        Text(item)
                        
                        
                    }
                }
            }.navigationTitle("Preview Notes")
        }
    }
    
    
    
    struct Day43_Previews: PreviewProvider {
        static var previews: some View {
            Day43()
        }
    }
    
}

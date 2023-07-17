//  Day42.swift
//  17/7/23

import SwiftUI

struct FollowersModel: Identifiable{
    let id: String = UUID().uuidString
    let firstname: String
    let lastname: String
    let username: String
    let image: String
}

class FollowersViewModel: ObservableObject{
    @Published var followers: [FollowersModel] = []
    @Published var isLoading:Bool  = false
    
    
    init(){
        getFollowers()
    }
    
    func getFollowers(){
        let follower = FollowersModel(firstname: "Nick", lastname: "Theodoridis", username: "nicktheodoridisiOS",image: "profile")
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now()+3.0){
            self.followers.append(follower)
            self.isLoading = false
        }
        
    }
}

struct Day42: View {
    
     var showSheet: Bool = false
    
    @State var sheetIsOpened = false
    
    @StateObject var followerViewModel: FollowersViewModel = FollowersViewModel()
    
    var body: some View {
       
        NavigationView{
            List{
                if(followerViewModel.isLoading){
                    ProgressView()
                }
                else{
                    ForEach(followerViewModel.followers) { follower in
                        HStack(spacing: 15){
                            Image(follower.image)
                                .resizable()
                                .foregroundColor(.accentColor)
                                .frame(width: 35,height: 35)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                HStack(spacing: 2){
                                    Text("\(follower.firstname)")
                                    Text("\(follower.lastname)")
                                }
                                Text("@\(follower.username)")
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Button(action: {
                                sheetIsOpened.toggle()
                                
                            }, label: {
                                Image(systemName: "info.circle")
                                    .foregroundColor(.accentColor)
                            })
                            
                            }
                        .sheet(isPresented: $sheetIsOpened){
                            SheetView(followerViewModel: followerViewModel)
                        }
                        }
                        
                }
                
                
                    
                }
            .navigationTitle("Followers")
        }
    }
}
    



struct SheetView:View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var followerViewModel: FollowersViewModel
    
    var body: some View{
        VStack(spacing: 20){
            Image("\(followerViewModel.followers[0].image)")
                .resizable()
                .frame(width: 100,height: 100)
                .clipShape(Circle())
            VStack(spacing: 3){
                HStack(spacing: 2){
                    Text(followerViewModel.followers[0].firstname)
                        .font(.title2)
                    Text(followerViewModel.followers[0].lastname)
                        .font(.title2)
                }
                Text("@\(followerViewModel.followers[0].username)")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .padding(.top,50)
    }
    
    struct Day42_Previews: PreviewProvider {
        static var previews: some View {
            Day42()
        }
    }
}





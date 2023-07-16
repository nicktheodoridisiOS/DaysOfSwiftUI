//  Day41.swift
//  16/7/23

import SwiftUI

struct FollowerModel: Identifiable{
    let id: String = UUID().uuidString
    let firstname: String
    let lastname: String
    let username: String
    let image: String
}

class FollowerViewModel: ObservableObject{
    @Published var followers: [FollowerModel] = []
    @Published var isLoading:Bool  = false
    
    func getFollowers(){
        let follower1 = FollowerModel(firstname: "Nick", lastname: "Theodoridis", username: "nicktheodoridisiOS",image: "profile")
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now()+3.0){
            self.followers.append(follower1)
            self.isLoading = false
        }
        
    }
}

struct Day41: View {
    
     var showSheet: Bool = false
    
    @StateObject var followerViewModel: FollowerViewModel = FollowerViewModel()
    
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
                            
                            }
                        }
                }
                
                
                    
                }
            .navigationTitle("Followers")
            .onAppear{
                followerViewModel.getFollowers()
            }
        }
    }
}
    


    
    struct Day41_Previews: PreviewProvider {
        static var previews: some View {
            Day41()
        }
    }




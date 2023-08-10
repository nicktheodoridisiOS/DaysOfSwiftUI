//  Day66.swift
//  10/8/23

import SwiftUI


struct UserModel: Hashable{
    let name: String
}

struct Day66: View {
    
    @State var showAlert: Bool = false;
    @State private var selectedUser: UserModel? = nil
    
    let data: [UserModel] = [
        UserModel(name: "Eden Sparks"),
        UserModel(name: "Emily Owens"),
        UserModel(name: "Liv Gates")
    ]
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    ForEach(data, id: \.self){ users in
                        HStack(spacing: 20){
                            Circle()
                                .foregroundColor(.secondary.opacity(0.1))
                                .frame(width: 50)
                            
                            Text(users.name)
                            Spacer()
                            Button {
                                selectedUser = users
                                showAlert = true
                            } label: {
                                HStack{
                                    Image(systemName: "info.circle")
                                        .font(.caption)
                                    Text("Get Info")
                                        .font(.caption)
                                }
                            }
                            .buttonStyle(.bordered)
                            .alert(isPresented: $showAlert) {
                                Alert(
                                    title: Text("User's Hash Value"),
                                    message: Text(selectedUser?.hashValue.description ?? "")
                                    
                                )
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top)
                    }
                    Spacer()
                }
                .padding()
            }.navigationTitle("Users")
        }.tint(.orange)
        
    }
    
    struct Day66_Previews: PreviewProvider {
        static var previews: some View {
            Day66()
        }
    }
}

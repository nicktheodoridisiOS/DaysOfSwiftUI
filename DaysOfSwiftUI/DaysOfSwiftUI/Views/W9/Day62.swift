//  Day62.swift
//  6/8/23

import SwiftUI

struct MyModel: Identifiable {
    let id =  UUID().uuidString
    let title: String
}

struct Day62: View {
    
    @State var selectedModel: MyModel? = nil
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing: 0){
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(0..<20){ _ in
                                Circle()
                            }
                        }
                        .foregroundColor(.secondary.opacity(0.3))
                        .frame(height: 70)
                        .frame(maxWidth: .infinity,alignment: .topLeading)
                        .padding()
                    }
                    
                    Divider()
                        .padding(.top,10)
                    HStack(spacing: 20){
                        Circle()
                            .frame(width: 40)
                            .onTapGesture {
                                selectedModel = MyModel(title: "Profile Sheet")
                               
                            }
                            .foregroundColor(.secondary.opacity(0.3))
                        Spacer()
                        Image(systemName: "ellipsis")
                            .onTapGesture {
                                selectedModel = MyModel(title: "Properties Sheet")
                            }
                            .foregroundColor(.orange)
                    }
                    .font(.title3)
                    .frame(maxWidth: .infinity , alignment: .bottomTrailing)
                    .padding(.top,10)
                    .padding(.bottom,10)
                    .fontWeight(.semibold)
                    .padding(.horizontal,20)
                    .sheet(item: $selectedModel) { model in
                        NextView(selectedModel: model)
                    }
                    Divider()
                    Rectangle()
                        .frame(height: 400)
                        .foregroundColor(.secondary.opacity(0.3))
                    VStack(alignment: .leading){
                        RoundedRectangle(cornerRadius: 5)
                            .frame(height: 10)
                            .foregroundColor(.secondary.opacity(0.2))
                            .frame(width: 300)
                        RoundedRectangle(cornerRadius: 5)
                            .frame(height: 10)
                            .foregroundColor(.secondary.opacity(0.2))
                            .frame(width: 200)
                    }
                    .frame(maxWidth: .infinity , alignment:.topLeading)
                    .padding()
                    
                    
                    Spacer()
                }
                .navigationTitle("Discover")
            }
        }
    }
}

struct NextView: View {
    
    let selectedModel : MyModel
    
    var body: some View {
        VStack{
            Text(selectedModel.title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.orange)
        }
    }
}



struct Day62_Previews: PreviewProvider {
    static var previews: some View {
        Day62()
    }
}

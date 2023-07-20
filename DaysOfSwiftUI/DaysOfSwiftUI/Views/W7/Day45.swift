//  Day44.swift
//  20/7/23

import SwiftUI

struct Day45: View {
    
    
    @State var scaleAmount: CGFloat = 0
    @State var tfText: String = ""
    
    var body: some View {
      
        NavigationView{
            VStack{
                Spacer()
                AsyncImage(url: URL(string: tfText), content: { phase in
                    switch phase{
                        case .empty:
                            ProgressView()
                        case .success(let returnedImage):
                            returnedImage
                                .resizable()
                                .frame(width:200 , height: 200)
                                .clipShape(Circle())
                        case .failure:
                            HStack{
                                Image(systemName: "exclamationmark.triangle")
                                Text("Invalid URL Image")
                            }
                            .foregroundColor(.secondary)
                            .bold()
                        default:
                            HStack{
                                Image(systemName: "exclamationmark.triangle")
                                Text("Invalid URL Image")
                            }
                            .foregroundColor(.secondary)
                            .bold()
                        }
                    
                    }
                )
                .scaleEffect(scaleAmount)
                .onAppear{
                    withAnimation(.spring()){
                        scaleAmount = 1
                    }
                }
                .frame(height: 300)
                
                Spacer()
                
                VStack{
                    Text("Image URL")
                        .bold()
                        .frame(maxWidth: .infinity , alignment: .leading)
                        .padding(.horizontal)
                    TextField("Enter the URL", text: $tfText, onEditingChanged: { bool in
                        
                        
                    })
                    .padding(.horizontal)
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("strcolor") , lineWidth: 1)
                            .frame(height: 57)
                            .background{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor( Color("rectcolor"))
                            }
                    }
                    .padding()
                }
                Spacer()
            }.navigationTitle("Search Image")
        }
        

}

struct Day45_Previews: PreviewProvider {
    static var previews: some View {
        Day45()
    }
}
                
}

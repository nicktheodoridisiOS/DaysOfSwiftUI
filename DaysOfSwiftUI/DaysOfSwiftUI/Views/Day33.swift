//  Day33.swift
//  8/7/23

import SwiftUI

struct Day33: View {
    
    @State var selection: Int = 0
    @State var daysLeft: Int = 0
    @State var scaleAmmount: CGFloat = 0
    
    
    var body: some View{
        NavigationView{
            VStack{
                Form{
                    Section(header: Text(""), content: {
                        Picker(
                            selection: $selection,
                            label:
                                HStack {
                                Text("Day")
                                }
                            ,content: {
                                ForEach(1...100, id: \.self){ number in
                                    Text("\(number)")
                                        .font(.title)
                                        .tag("\(number)")
                                    
                                }
                                
                            })
                        
                    }
                )}
                .frame(height: 90)
                
                Button {
                    daysLeft = 100 - selection
                    withAnimation(.spring()){
                        scaleAmmount = 1
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(maxHeight: 57)
                        .padding()
                        .foregroundColor(.red)
                        .overlay{
                            Text("Calculate")
                                .bold()
                                .foregroundColor(.white)
                        }
                }
                
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.gray.opacity(0.2))
                    .frame(width: 180, height: 180)
                    .overlay{
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.red, lineWidth: 1)
                            VStack{
                                Text("Remaining Days")
                                    .font(.system(size: 18,design: .rounded))
                                    .foregroundColor(.primary)
                                Text("\(daysLeft)")
                                    .scaleEffect(scaleAmmount)
                                    .font(.system(size: 90,design: .rounded))
                                    .foregroundColor(.red)
                            }
                            .offset(y:5)
                        .bold()
                        }
                        
                    }
                    .padding()
                
                 
            }
            .navigationTitle("Days Calculator")
            .frame(maxHeight: .infinity , alignment: .topLeading)
        }
        
        
        
    }
    
    struct Day33_Previews: PreviewProvider {
        static var previews: some View {
            Day33()
        }
    }
}




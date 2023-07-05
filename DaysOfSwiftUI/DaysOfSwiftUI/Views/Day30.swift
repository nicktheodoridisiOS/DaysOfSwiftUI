//  Day30.swift
//  5/7/23
import SwiftUI

struct Day30: View {
    
    @State var tfText: String = ""
    
    @State var dataArray: [String] = []
    
    @State var tfStrokeColor: Bool = false
    @State var tfFdColor: Bool = false
    @State var showActionSheet: Bool = false
    @State var errorMessage: Bool = false
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(spacing: 25){
                    VStack {
                        HStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.gray.opacity(0.2))
                                .frame(width: 90 , height: 57)
                                .overlay{
                                    Text("🇬🇷 +30")
                                        .bold()
                                }
                            
                            TextField("Phone Number", text: $tfText, onEditingChanged: { bool in
                                withAnimation(.spring()){
                                    tfStrokeColor  = true
                                    tfFdColor = true
                                    errorMessage = true
                                }
                                
                            })
                            .padding(.horizontal)
                            .background{
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(tfStrokeColor ? Color("strcolor") : Color.primary.opacity(0), lineWidth: 1)
                                    .frame(height: 57)
                                    .background{
                                        RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(tfFdColor ? Color("rectcolor").opacity(0.4) : Color.primary.opacity(0))
                                    }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        
                        Text("Phone number must have 10 digits.")
                            .foregroundColor(.gray.opacity(0.5))
                            .font(.caption)
                            .frame(maxWidth: .infinity ,alignment:.bottomTrailing)
                            .padding(.horizontal ,20)
                            .opacity(textIsAppropriate() ? 0 : 1 )
                            
                        
                        
                        
                        
                    }
                    
                    
                    Button {
                        if (textIsAppropriate()){
                            addPhone()
                        }
                    } label: {
                        Text("Add Phone")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(textIsAppropriate() ? Color.accentColor.cornerRadius(10) : Color.gray.cornerRadius(10))
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding(.horizontal)
                    }
                    
                    VStack(spacing: 10){
                        ForEach(dataArray, id: \.self) { data in
                            Button {
                                showActionSheet.toggle()
                            } label: {
                                HStack(spacing: 2){
                                    Image(systemName: "phone")
                                        .foregroundColor(.green)
                                        .padding(.horizontal)
                                        .offset(x:15)
                                    
                                    Text("+30 \(data)" )
                                        .padding()
                                        .bold()
                                        .frame(maxWidth: .infinity,alignment:.topLeading)
                                        .background(Color.gray.opacity(0.1).cornerRadius(10))
                                        .foregroundColor(.white)
                                        .font(.headline)
                                        .padding(.horizontal)
                                }
                            }
                            .confirmationDialog("Edit", isPresented: $showActionSheet, titleVisibility: .automatic){
                                Button("Call"){
                                    
                                }
                                Button("Copy"){
                                    
                                }
                                Button("Delete",role: .destructive){
                                    
                                }
                            } message: {
                                Text("What would you like to do?")
                            }

                        }
                    }
                    
                }
            }
            .navigationTitle("Phone Agenda")
        }
        
        
    }
    
    func textIsAppropriate() -> Bool{
        if tfText.count == 10 {
            errorMessage = false
            return true
        }
        
        return false
    }
    
    func addPhone(){
        dataArray.append(tfText)
        tfText = ""
    }

}
    
struct Day30_Previews: PreviewProvider {
    static var previews: some View {
        Day30()
    }
}



    

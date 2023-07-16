//  Day31.swift
//  6/7/23

import SwiftUI

struct Day31: View {
    
    @State var firstname: String = ""
    @State var lastname: String = ""
    @State var city: String = ""
    @State var message: String = ""
    
    @State var firstnameenable: Bool = false
    @State var showAlert: Bool = false
    
    @State var isMessageVisible: Bool = false
    @State var messageOpacity: CGFloat = 0
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                
                VStack(alignment: .leading){
                    HStack(spacing: 5){
                        Text("First Name")
                            .bold()
                        Text("*")
                            .foregroundColor(.red)
                            .bold()
                    }
                    TextField("First Name", text: $firstname)
                    .padding(.horizontal)
                    .background{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 57)
                                .foregroundColor(Color("rectcolor"))
                                
                    }
                    .padding(.top)
                }
                
                VStack(alignment: .leading){
                    HStack(spacing: 5){
                        Text("Last Name")
                            .bold()
                        Text("*")
                            .foregroundColor(.red)
                            .bold()
                    }
                    TextField("Last Name", text: $lastname)
                    .padding(.horizontal)
                    .background{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 57)
                                .foregroundColor(Color("rectcolor"))
                                
                    }
                    .padding(.top)
                }
                .padding(.top)
                
                VStack(alignment: .leading){
                    HStack(spacing: 5){
                        Text("City")
                            .bold()
                        Text("")
                            .foregroundColor(.red)
                            .bold()
                    }
                    TextField("City", text: $city)
                    .padding(.horizontal)
                    .background{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 57)
                                .foregroundColor(Color("rectcolor"))
                                
                    }
                    .padding(.top)
                }
                .padding(.top)
                
                VStack(alignment: .leading){
                    HStack(spacing: 5){
                        Text("Message")
                            .bold()
                        Text("*")
                            .foregroundColor(.red)
                            .bold()
                    }
                    TextEditor(text: $message)
                        .colorMultiply(.secondary)
                        
                        
                        
                }
                .padding(.top)
                
                
                Button {
                    if(isEnabled()){
                        clearFields()
                        showAlert.toggle()
                    }
                } label: {
                    Text("Send")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isEnabled() ? Color.red.cornerRadius(10) : Color.secondary.cornerRadius(10))
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(10)
                }
                .alert(isPresented: $showAlert) {
                   getAlert()
                }

                
                
            }
            .navigationTitle("Contact Form")
            .frame(maxWidth: .infinity , maxHeight: .infinity , alignment: .topLeading)
            .padding()
            .padding(.horizontal,5)
        }
    }
    
    func isEnabled() -> Bool{

        if firstname.count >= 1 && lastname.count >= 1 && message.count >= 1{
            return true
            
        }
        return false
    }
    
    
    func clearFields(){
        firstname = ""
        lastname = ""
        city = ""
        message = ""
    }
    
    func getAlert() -> Alert{
        return Alert(
            title: Text("Message Sent Succesfully!")
        )
    }
    
}


struct Day31_Previews: PreviewProvider {
    static var previews: some View {
        Day31()
    }
}

//  Day50.swift
//  25/7/23


import SwiftUI

struct Day50: View {
    
    @State var text: String  = ""
    
    var body: some View {
        VStack(spacing: 50){
            TextField("Continue Placeholder", text: $text)
            .padding(.horizontal)
            .submitLabel(.continue)
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("strcolor"), lineWidth: 1)
                    .frame(height: 57)
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("rectcolor"))
                    }
            }
            
            TextField("Done Placeholder", text: $text)
            .padding(.horizontal)
            .submitLabel(.done)
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("strcolor"), lineWidth: 1)
                    .frame(height: 57)
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("rectcolor"))
                    }
            }
            
            TextField("Go Placeholder", text: $text)
            .padding(.horizontal)
            .submitLabel(.go)
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("strcolor"), lineWidth: 1)
                    .frame(height: 57)
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("rectcolor"))
                    }
            }
            
            TextField("Join Placeholder", text: $text)
            .padding(.horizontal)
            .submitLabel(.join)
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("strcolor"), lineWidth: 1)
                    .frame(height: 57)
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("rectcolor"))
                    }
            }
        }
        .padding()
    }
}

struct Day50_Previews: PreviewProvider {
    static var previews: some View {
        Day50()
    }
}

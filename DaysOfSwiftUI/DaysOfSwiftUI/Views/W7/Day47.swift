//  Day47.swift
//  22/7/23

import SwiftUI

struct Day47: View {
    var body: some View {
        VStack(spacing: 30){
            Text("Copy the 16 digit code to verify your account:")
                .font(.subheadline)
                .frame(maxWidth: .infinity , alignment: .topLeading)
                .bold()
            Text("d2re-t7ew-rd4f-6e9g")
                .font(.system(size: 17,design: .monospaced))
                .textSelection(.enabled)
                .frame(maxWidth: .infinity , alignment: .topLeading)
                .padding()
                .background{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color("rectcolor"))
                        .frame(maxWidth: .infinity)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("strcolor"))
                        }
                }
        }
        .padding()
    }
}

struct Day47_Previews: PreviewProvider {
    static var previews: some View {
        Day47()
    }
}

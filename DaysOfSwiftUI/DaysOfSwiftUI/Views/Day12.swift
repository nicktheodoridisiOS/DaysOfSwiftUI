//
//  Day12.swift
//  DaysOfSwiftUI
//
//  Created by Nick Theodoridis on 16/6/23.
//

import SwiftUI

struct Day12: View {
    
    var colorPriority: Color
    var name: String
    
    init(name:String, priority: Priority) {
        
        self.name = name
        
        if priority == .high {
            self.colorPriority = .red
        }
        else if priority == .medium {
            self.colorPriority = .orange
        }
        else{
            self.colorPriority = .yellow
        }
    }
    
    enum Priority{
        case low
        case medium
        case high
    }
    
    var body: some View {
        VStack{
            HStack(spacing: 20){
                VStack{
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.white)
                        .frame(width: 160,height: 160)
                        .overlay{
                            VStack(spacing: 5){
                                Rectangle()
                                    .foregroundColor(.gray.opacity(0.2))
                                    .frame(maxWidth: .infinity , maxHeight: 1)
                                HStack(spacing: 5){
                                    Image(systemName: "circle")
                                        .foregroundColor(colorPriority)
                                    Text(name)
                                        .font(.system(size: 14 , weight: .semibold , design: .rounded))
                                        .foregroundColor(colorPriority)
                                    
                                    Spacer()
                                }
                                .padding(.horizontal,5)
                                .frame(maxWidth: .infinity)
                                Rectangle()
                                    .foregroundColor(.gray.opacity(0.2))
                                    .frame(maxWidth: .infinity , maxHeight: 1)
                                
                            }
                           
                            
                        }
                }
                VStack(spacing: 20){
                    HStack(spacing: 20){
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 70,height: 70)
                            .foregroundColor(.gray.opacity(0.3))
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 70,height: 70)
                            .foregroundColor(.gray.opacity(0.3))
                    }
                    HStack(spacing: 20){
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 70,height: 70)
                            .foregroundColor(.gray.opacity(0.3))
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 70,height: 70)
                            .foregroundColor(.gray.opacity(0.3))
                    }
                }
  
            }
            .padding(.top)
            .padding(.bottom,20)
            HStack(spacing: 20){
                VStack(spacing: 20){
                    HStack(spacing: 20){
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 70,height: 70)
                            .foregroundColor(.gray.opacity(0.3))
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 70,height: 70)
                            .foregroundColor(.gray.opacity(0.3))
                    }
                    HStack(spacing: 20){
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 70,height: 70)
                            .foregroundColor(.gray.opacity(0.3))
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 70,height: 70)
                            .foregroundColor(.gray.opacity(0.3))
                    }
                }
                VStack(spacing: 20){
                    HStack(spacing: 20){
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 70,height: 70)
                            .foregroundColor(.gray.opacity(0.3))
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 70,height: 70)
                            .foregroundColor(.gray.opacity(0.3))
                    }
                    HStack(spacing: 20){
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 70,height: 70)
                            .foregroundColor(.gray.opacity(0.3))
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 70,height: 70)
                            .foregroundColor(.gray.opacity(0.3))
                    }
                }
            }
            Spacer()
            
            
        }
       
        
    }
    
    
    struct Day12_Previews: PreviewProvider {
        static var previews: some View {
            Day12(name: "Upload Day 12", priority: .high)
        }
    }
    
}

//  Day63.swift
//  7/8/23


import SwiftUI

struct Day63: View {
    
    @State var rating: CGFloat = 0
    @State var enabletext: Bool = false
    
    var body: some View {
        VStack(spacing: 100){
            VStack(alignment: .center,spacing: 20){
                Image("icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width:80)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                VStack(spacing: 5){
                    Text("Enjoying 100 Days \nOf SwiftUI Challenge?")
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.primary)
                    Text("Tap a star to rate it.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                }
               
                starView
                    .overlay(overlayView.mask(starView))
                
                
                Button("Submit"){
                    withAnimation(.spring()){
                        enabletext = true
                    }
                }
                .buttonStyle(.bordered)
                .padding(.top)
            }
            .background{
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 250,height: 350)
                    .foregroundColor(Color("rectcolor"))
                    .overlay{
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color("strcolor"))
                            .frame(width: 250,height: 350)
                    }
                  
            }
            .padding(.top,30)
            
            Text("Rating submitted successfully!")
                .foregroundColor(.green)
                .font(.caption)
                .background{
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.green.opacity(0.2))
                        .frame(width: 200 , height: 30)
                }
                .opacity(enabletext ? 1 : 0)
        }
    }
    
    private var overlayView: some View{
        GeometryReader{ geometry in
            ZStack(alignment: .leading){
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: rating / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
        
    }
    
    private var starView: some View{
        HStack(spacing: 0){
            ForEach(1..<6){ index in
                    Image(systemName: "star.fill")
                    .font(.callout)
                    .foregroundColor(Color.gray)
                        .onTapGesture{
                            withAnimation(.easeInOut){
                                rating = CGFloat(index)
                            }
                        }
            }
        }
    }
}

struct Day63_Previews: PreviewProvider {
    static var previews: some View {
        Day63()
    }
}

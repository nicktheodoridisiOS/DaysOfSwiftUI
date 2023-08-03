//  Day59.swift
//  3/8/23

import SwiftUI

struct Day59: View {
    
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.8
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack{
            ExtractedDragView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y:endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            withAnimation(.spring()){
                                currentDragOffsetY = value.translation.height
                
                            }
                            
                            
                        }
                        .onEnded{ value in
                            
                            
                            withAnimation(.spring()){
                                if endingOffsetY > -150{
                                    endingOffsetY = -startingOffsetY
                                    currentDragOffsetY = 0
                                }
                                else if endingOffsetY != 0 && currentDragOffsetY > 150{
                                    
                                        endingOffsetY = 0
                                        currentDragOffsetY = 0
                                }
                                else{
                                    currentDragOffsetY = 0
                                }
                            }
                            
                        }
                )
            
            
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct Day59_Previews: PreviewProvider {
    static var previews: some View {
        Day59()
    }
}

struct ExtractedDragView: View {
    var body: some View {
        VStack{
            Text("More Info")
                .offset(y:25)
        }
        .bold()
        .foregroundColor(.accentColor)
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 15)
    }
}

//  Day48.swift
//  23/7/23

import SwiftUI

struct Day48: View {
    
    @State var week: [String] = [
        "Week 1",
        "Week 2",
        "Week 3",
        "Week 4",
        "Week 5",
        "Week 6",
        "Week 7",
        "Week 8",
        "Week 9",
        "Week 10",
        "Week 11",
        "Week 12",
        "Week 13",
        "Week 14",
        "Week 15"
    ]
    
    var body: some View {
        NavigationView {
            List{
                Section(header:
                            HStack{
                    Image(systemName: "calendar")
                    Text("Weeks")
                }
                ){
                    ForEach(week, id: \.self){ week in
                        Text(week)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true){
                                Button {
                                    
                                } label: {
                                    Image(systemName: "pencil")
                                }
                                .tint(.orange)
                            }
                            .swipeActions(edge: .leading, allowsFullSwipe: true){
                                Button {
                                    
                                } label: {
                                    Image(systemName: "archivebox.fill")
                                }
                                .tint(.blue)
                            }
                    }
                }
                .navigationTitle("100 Days of SwiftUI")
                .listStyle(SidebarListStyle())
            }
            .accentColor(.orange)
            .bold()
        }
    }
    
    struct Day48_Previews: PreviewProvider {
        static var previews: some View {
            Day48()
        }
    }
}

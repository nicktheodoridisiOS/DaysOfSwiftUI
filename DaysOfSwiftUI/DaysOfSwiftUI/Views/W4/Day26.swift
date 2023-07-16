//  Day26.swift
//  1/7/23

import SwiftUI

struct Day26: View {
    
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
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
            }
            .navigationTitle("100 Days of SwiftUI")
            .navigationBarItems(leading: EditButton())
            .listStyle(SidebarListStyle())
        }
        .accentColor(.orange)
        .bold()
    }
    
    
    func delete(indexSet: IndexSet){
        week.remove(atOffsets: indexSet)
    }
    
    func move(indices: IndexSet , newOffset: Int){
        week.move(fromOffsets: indices, toOffset: newOffset)
        
    }
}

struct Day26_Previews: PreviewProvider {
    static var previews: some View {
        Day26()
    }
}

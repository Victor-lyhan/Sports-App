//
//  ActivityView.swift
//  Side Menu Test 2
//
//  Created by Millan Bhandari on 8/1/22.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var assignmentItem = AssignmentItems()
    @State private var showingAddItemView = false
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentItem.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.course)
                                .font(.headline)
                            Text(item.description)
                                .accentColor(.red)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                }
                .onMove { indices, newOffset in
                    assignmentItem.items.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete{ indexSet in
                    assignmentItem.items.remove(atOffsets: indexSet)
                }
            }
            .sheet(isPresented: $showingAddItemView, content: {
                AddItemview(assignmentItem: assignmentItem)
            })
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                showingAddItemView = true }) {
                    Image(systemName: "plus")
                    
                })
            .navigationBarTitle("Add Activity",  displayMode: .inline)
            
            }
        }
    }

struct AssignmentItem: Identifiable, Codable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}


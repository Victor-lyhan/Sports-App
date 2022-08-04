//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Millan Bhandari on 7/25/22.
//

import SwiftUI

struct Court: View {
    @ObservedObject var assignmentItem1 = AssignmentItems1()
    @State private var showingAddItemView = false
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentItem1.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(item.finalAnswer) Calories")
                                .font(.headline)
                            Text(item.course)
                                .foregroundColor(.red)
                                .fontWeight(.bold)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                }
                .onMove { indices, newOffset in
                    assignmentItem1.items.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete{ indexSet in
                    assignmentItem1.items.remove(atOffsets: indexSet)
                }
            }
            .sheet(isPresented: $showingAddItemView, content: {
                AddItemView1(assignmentItem1: assignmentItem1)
            })
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                showingAddItemView = true }) {
                    Image(systemName: "plus")
                    
                })
            .navigationBarTitle("Calories Burned Log",  displayMode: .inline)
            .foregroundColor(.accentColor)
        }
        .accentColor(.black)
        HStack {
        Image(systemName: "exclamationmark.triangle.fill")
        Text("results are not 100% accurate")
            .font(.footnote)
        }
    }
}

struct AssignmentItem1: Identifiable, Codable {
    var id = UUID()
    var finalAnswer = Int()
    var description = String()
    var dueDate = Date()
    var course = String()
}

struct Court_Previews: PreviewProvider {
    static var previews: some View {
        Court()
    }
}

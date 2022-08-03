//
//  AddItemview.swift
//  Side Menu Test 2
//
//  Created by Millan Bhandari on 8/1/22.
//

import SwiftUI

struct AddItemview: View {
    @ObservedObject var assignmentItem : AssignmentItems
    @State private var courses = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let courses = ["Running", "Tennis", "Basketball", "Soccer", "Football", "Pickleball", "Volleyball", "Others"]
    var body: some View {
        NavigationView {
            Form {
                Picker("Activity Type", selection: $courses) {
                    ForEach(Self.courses, id: \.self) { courses in
                        Text(courses)
                    }
                }
                TextField("Description", text: $description)
                DatePicker("Date of Completion", selection: $dueDate)
            }
            .navigationBarTitle("Add New Activity", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                if courses.count > 0 && description.count > 0 {
                    let item = AssignmentItem(id: UUID(), course: courses,
                                               description: description, dueDate: dueDate)
                    assignmentItem.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemview(assignmentItem : AssignmentItems())
    }
}

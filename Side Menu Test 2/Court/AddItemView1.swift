//
//  AddItemView.swift
//  Assignment Notebook
//
//  Created by Millan Bhandari on 7/25/22.
//

import SwiftUI

struct AddItemView1: View {
    @ObservedObject var assignmentItem1 : AssignmentItems1
    @State private var courses = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @State private var color = ""
    @State private var weight = ""
    @State private var timeSpent = ""
    @State private var activity = ""
    @State private var metCalc = 0
    @State private var finalAnswer = 0
    @Environment(\.presentationMode) var presentationMode
    static let courses = ["Basketball", "Soccer"]
    var body: some View {
        NavigationView {
            Form {
                Picker("Sport", selection: $activity) {
                    ForEach(Self.courses, id: \.self) { courses in
                        Text(courses)
                    }
                }
                .padding()
                TextField("Weight in KG", text: $weight)
                    .keyboardType(.numberPad)
                    .padding()
                TextField("Time in minutes", text: $timeSpent)
                    .keyboardType(.numberPad)
                    .padding()
                //Picker("Activity", selection: $activity) {
                //    Text("Basketball").tag("basketball")
                    //    Text("Soccer").tag("soccer")
              //  }
              //  .pickerStyle(.segmented)
              //  .padding()
                Button("Calculate") {
                    METCALC()
                    Calculate()
                    courses = activity
                }
                Text("\(finalAnswer)" + " Calories Burned")
                    .fontWeight(.bold)
                    .font(.title)
                .padding()
            }
            .navigationBarTitle("Calculate Your Workout", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                if timeSpent.count > 0 {
                    let item = AssignmentItem1(id: UUID(), finalAnswer: finalAnswer, course: courses)
                    assignmentItem1.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
    func METCALC() {
        if activity == "Basketball" {
            metCalc = 8
        }
        if activity == "Soccer" {
            metCalc = 6
        }
    }
    func Calculate() {
        if let weight1 = Int(weight) {
            if let timespent1 = Int(timeSpent) {
                finalAnswer = timespent1 * (metCalc * 4 * weight1) / 200
            }
        }
    }
}

struct AddItemView1_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView1(assignmentItem1 : AssignmentItems1())
    }
}
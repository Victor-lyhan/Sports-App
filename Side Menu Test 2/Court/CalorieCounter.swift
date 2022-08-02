//
//  Court.swift
//  Side Menu Test 2
//
//  Created by Millan Bhandari on 8/1/22.
//

import SwiftUI

struct Court: View {
    @State private var weight = ""
    @State private var timeSpent = ""
    @State private var activity = ""
    @State private var metCalc = 0
    @State private var finalAnswer = 0
    var body: some View {
        NavigationView{
            VStack {
                HStack {
                Text("Calorie Calulator")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                }
                TextField("Weight in KG", text: $weight)
                    .keyboardType(.numberPad)
                    .padding()
                TextField("Time in minutes", text: $timeSpent)
                    .keyboardType(.numberPad)
                    .padding()
                Picker("Activity", selection: $activity) {
                    Text("Basketball").tag("basketball")
                    Text("Soccer").tag("soccer")
                }
                .pickerStyle(.segmented)
                .padding()
                Button("Calculate") {
                    METCALC()
                    Calculate()
                }
                .padding()
                Text("\(finalAnswer)" + " Calories Burned")
                    .fontWeight(.bold)
                    .font(.title)
                Spacer()
            }
        }
    }
    func METCALC() {
        if activity == "basketball" {
            metCalc = 8
        }
        if activity == "soccer" {
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

struct Court_Previews: PreviewProvider {
    static var previews: some View {
        Court()
    }
}

struct ListItems: Identifiable, Codable{
    var id = UUID()
    var calories = Int()
}

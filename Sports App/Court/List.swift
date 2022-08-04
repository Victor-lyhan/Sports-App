//
//  ToDoList.swift
//  Assignment Notebook
//
//  Created by Millan Bhandari on 7/25/22.
//

import Foundation

class AssignmentItems1: ObservableObject {
    @Published var items : [AssignmentItem1] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "data1")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "data1") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([AssignmentItem1].self, from: items) {
                self.items = decoded
                return
            }
        }
        items = []
    }
}

//
//  Profile.swift
//  Side Menu Test 2
//
//  Created by Millan Bhandari on 8/3/22.
//

import SwiftUI

struct Profile: View {
    @EnvironmentObject var AppInfo : AppInformation
    @State var username = ""
    @State var savedName = ""
    var body: some View {
        NavigationView {
            VStack {
                Text("\(AppInfo.savedName)")
                    .fontWeight(.bold)
                    .font(.title)
                Spacer()
                Text("Enter Your Name")
                    .fontWeight(.bold)
                TextField("Enter Your name", text: $AppInfo.username)
                Button(action: {saveData() }) {
                    Text("Save")
                }
                Spacer()
            }.onAppear(perform: {
                getData()
            })
        }
    }
    func saveData() {
        UserDefaults.standard.set(self.AppInfo.username, forKey: "username")
        return
    }
    func getData() {
        AppInfo.savedName = UserDefaults.standard.string(forKey: "username") ?? ""
        return
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}

class AppInformation: ObservableObject {
    @Published var username = ""
    @Published var savedName = ""
}

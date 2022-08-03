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
                Text("Welcome: \(AppInfo.username)")
                    .fontWeight(.bold)
                    .font(.title)
                Text("Enter Your Name")
                    .fontWeight(.bold)
                TextField("Enter Your name", text: $AppInfo.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button(action: {saveData() }) {
                    Text("Save")
                }
                .onTapGesture {
                    getData()
                }
                .buttonStyle(RoundedRectangleButtonStyle2())
                .padding()
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

struct RoundedRectangleButtonStyle2: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      Spacer()
      configuration.label.foregroundColor(.white)
      Spacer()
    }
    .padding()
    .background(Color.blue.cornerRadius(8))
    .scaleEffect(configuration.isPressed ? 0.95 : 1)
  }
}


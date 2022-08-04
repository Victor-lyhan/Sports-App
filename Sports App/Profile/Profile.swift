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
    @State var imageName = ""
    var body: some View {
        NavigationView {
            VStack {
                Text("Profile Settings")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                Text("Welcome: \(AppInfo.username)")
                    .fontWeight(.bold)
                    .font(.title3)
                    .padding()
                Text("Enter Your Name")
                    .fontWeight(.bold)
                TextField("Enter Your name", text: $AppInfo.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 150, height: 25, alignment: .center)
                    .padding()
                Button(action: {saveData() }) {
                    Text("Save")
                }
                .onTapGesture {
                    getData()
                    return
                }
                .buttonStyle(RoundedRectangleButtonStyle2())
                .padding()
                Image("\(imageName)")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                Spacer()
            }.onAppear(perform: {
                getData()
            })
            .onChange(of: AppInfo.username) { newValue in
                imageName = ""
            }
        }
    }
    func saveData() {
        UserDefaults.standard.set(self.AppInfo.username, forKey: "username")
        imageName = "check"
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
        .frame(width: 175, height: 50, alignment: .center)
        .background(Color.green.cornerRadius(8))
        .scaleEffect(configuration.isPressed ? 0.85 : 1)
    }
}


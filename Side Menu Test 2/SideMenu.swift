//
//  SideMenu.swift
//  Side Menu Test 2
//
//  Created by Victor Han on 2022/7/28.
//

import SwiftUI

struct SideMenu: View {
    @Binding var showMenu: Bool
    @State private var showingSettingView = false
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            VStack(alignment: .leading, spacing: 12){
                Image("Millan&Victor")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                Text("Millan and Victor")
                    .font(.title2.bold())
                
            }
            .padding(.horizontal)
            .padding(.leading)
            .padding(.bottom)
            
            
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    VStack(alignment: .leading, spacing: 45){
                        //tabs button
                        TabButton(title: "Profile", image:"Profile")
                        TabButton(title: "Map", image:"Map")
                        TabButton(title: "Calorie Calc", image:"Court")
                        TabButton(title: "Activity", image:"Activity")
                    }
                    .padding()
                    .padding(.leading)
                    .padding(.top,30)
                }
                Divider()
                TabButton(title: "Help Center", image: "Help Center")
                    .padding()
                    .padding(.leading)
                    .padding(.top,10)
            }
        }
        .padding(.top)
        .frame(maxWidth:.infinity, alignment: .leading)
        // Max Width...
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(
            Color.primary
                .opacity(0.04)
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .frame(maxWidth:.infinity, alignment: .leading)
    }
}

@ViewBuilder
func TabButton(title: String, image: String)->some View{
    
    // for naviagtion...
    // Simple replace button with navigation Links
    
    NavigationLink {
        if(title == "Profile"){
            Text("Profile")
        }
        else if(title == "Map"){
            MapView()
        }
        else if(title == "Activity"){
            ActivityView()
        }
        else if(title == "Calorie Calc"){
            Court()
        }
        else {
          Text("Help Center")
            HelpCenterView()
        }
        
    } label: {
        HStack(spacing: 14){
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 22, height: 22)
            Text(title)
        }
        .foregroundColor(.primary)
        .frame(maxWidth:.infinity, alignment: .leading)
    }

}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// extenting view to get screen rect...
extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
        
    }
}

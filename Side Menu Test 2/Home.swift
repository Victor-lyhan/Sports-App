//
//  Home.swift
//  Side Menu Test 2
//
//  Created by Victor Han on 2022/7/29.
//

import SwiftUI

struct Home: View {
    @Binding var showMenu: Bool
    var body: some View {
        //top
        VStack{
            VStack(spacing:0){
                HStack{
                    Button{
                        withAnimation{showMenu.toggle()}
                    } label: {
                        Image("Millan&Victor")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical,10)
                Divider()
            }
            .overlay(
                HStack{
                    Text("SportsMan")
                        .bold()
                        .font(.system(size: 20))
                    Image("Logo")
                }
                
            )
            Spacer()
        }
        //middle
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

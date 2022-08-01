//
//  Home.swift
//  Side Menu Test 2
//
//  Created by Victor Han on 2022/7/29.
//

import SwiftUI

struct Home: View {
    var numberofImages = 6
    var timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State var currentIndex = 0
    @Binding var showMenu: Bool
    
    func Previous() {
        withAnimation {
            currentIndex = currentIndex > 0 ?
            currentIndex - 1 : numberofImages - 1
        }
    }
    func Next() {
        withAnimation {
            currentIndex = currentIndex <
                numberofImages ? currentIndex + 1 : 0
        }
    }
    var control: some View {
        HStack {
            Button {
                Previous()
            } label: {
                Image(systemName: "chevron.left")
            }
            .accentColor(.primary)
            Spacer()
                .frame(width: 120)
            Button {
                Next()
            } label: {
                Image(systemName: "chevron.right")
            }
            .accentColor(.primary)
        }
    }
    
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
            GeometryReader { proxy in
                VStack {
                    TabView(selection: $currentIndex) {
                        ForEach(1..<6) { num in
                            Image("\(num)")
                                .resizable()
                                .scaledToFill()
                                .overlay(Color.gray.opacity(0.3))
                                .tag(num)
                        }
                    }.tabViewStyle(PageTabViewStyle())
                        .padding()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: proxy.size.width, height: proxy.size.height/3, alignment: .center)
                        .onReceive(timer, perform: { _ in
                            Next()
                        })
                    control
                }
            }
                }
        }
    }


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

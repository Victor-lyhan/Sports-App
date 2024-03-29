//
//  Home.swift
//  Side Menu Test 2
//
//  Created by Victor Han on 2022/7/29.
//

import SwiftUI

struct Home: View {
    var numberofImages = 4
    var timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State var currentIndex = 0
    @State var numberofImages1 = 5
    var timer1 = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State var currentIndex1 = 3
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
    func Previous1() {
        withAnimation {
            currentIndex1 = currentIndex1 > 0 ?
            currentIndex1 - 1 : numberofImages1 - 1
        }
    }
    func Next1() {
        withAnimation {
            currentIndex1 = currentIndex1 <
                numberofImages1 ? currentIndex1 + 1 : 7
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
                    Text("Sports App")
                        .bold()
                        .font(.system(size: 20))
                    Image("Logo")
                        .clipShape(Circle())
                }
                
            )
            Spacer()
            VStack {
                GeometryReader { proxy in
                    VStack {
                        TabView(selection: $currentIndex) {
                            ForEach(0..<5) { num in
                                Image("\(num)")
                                    .resizable()
                                    //.frame(width: 350, height: proxy.size.height/1.1, alignment: .center)
                                    .scaledToFit()
                                    .tag(num)
                                    .border(.black)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }.tabViewStyle(PageTabViewStyle())
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                    }
                    
                }
                Divider()
                GeometryReader { proxy in
                    VStack {
                        TabView(selection: $currentIndex1) {
                            ForEach(8..<11) { num in
                                Image("\(num)")
                                    .resizable()
                                    //.frame(width: 350, height: proxy.size.height/1.1, alignment: .center)
                                    .scaledToFit()
                                    .tag(num)
                                    .border(.black)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }.tabViewStyle(PageTabViewStyle())
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                    }
                }
                Divider()
                GeometryReader { proxy in
                    VStack {
                        TabView(selection: $currentIndex1) {
                            ForEach(5..<8) { num in
                                Image("\(num)")
                                    .resizable()
                                    //.frame(width: 350, height: proxy.size.height/1.1, alignment: .center)
                                    .scaledToFit()
                                    .tag(num)
                                    .border(.black)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }.tabViewStyle(PageTabViewStyle())
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
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
}

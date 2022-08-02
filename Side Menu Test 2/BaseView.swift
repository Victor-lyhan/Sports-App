//
//  BaseView.swift
//  Side Menu Test 2
//
//  Created by Victor Han on 2022/7/28.
//


import SwiftUI

struct BaseView: View {
    @State var showMenu: Bool = false
    
    // Hiding Native One
    init(){
        UITabBar.appearance().isHidden =  true
    }
    @State var currentTab = "Home"
    
    // offset for both drag gesture and showing Menu...
    @State var offset: CGFloat = 0
    @State var lastStoreOffset: CGFloat = 0
    var body: some View {
        
        let sideBarWidth = getRect().width - 90
        
        // Whole navigation view ...
        NavigationView {
            
            HStack(spacing: 0) {
                
                // side menu ...
                SideMenu(showMenu: $showMenu)
                
                // main tab view ...
                VStack(spacing:0){
                    TabView(selection:$currentTab){
                        Home(showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Home")

                    }
                    // custom tab bar...
                    VStack(spacing:0){
                        Divider()

                        .padding([.top],20)
                    }
                }
                .frame(width: getRect().width)
                // BG when menu is showing
                .overlay(
                    Rectangle()
                        .fill(
                            Color.primary
                                .opacity(Double((offset / sideBarWidth) / 5))
                        )
                        .ignoresSafeArea(.container, edges: .vertical)
                        .onTapGesture {
                            withAnimation{
                                showMenu.toggle()
                            }
                        }
                )
            }
            // max size ...
            .frame(width: getRect().width + sideBarWidth)
            .offset(x: -sideBarWidth/2)
            .offset(x: offset)
            // no naviagtion bar title ...
            // Hiding nav bar ...
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
        .animation(.easeOut, value: offset == 0)
        .onChange(of: showMenu){ newValue in
            if showMenu && offset == 0{
                offset = sideBarWidth
                lastStoreOffset = offset
            }
            if !showMenu && offset == sideBarWidth{
                offset = 0
                lastStoreOffset = 0
            }
        }
    }
    

    @ViewBuilder
    func TabButton(image:String)->some View{
        Button{
            withAnimation{currentTab = image}
        } label:{
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(currentTab == image ? .primary : .gray)
                .frame(maxWidth:.infinity)
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}

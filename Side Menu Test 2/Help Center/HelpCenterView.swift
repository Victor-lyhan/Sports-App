//
//  HelpCenterView.swift
//  Side Menu Test 2
//
//  Created by Victor Han on 2022/8/1.
//

import SwiftUI

struct HelpCenterView: View {
    let questionItems : [QuestionAnswer] = [ q1(), q2(), q3() ]
    @State var numberofImages1 = 5
    var timer1 = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State var currentIndex1 = 3
    
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
    var control1: some View {
        HStack {
            Button {
                Previous1()
            } label: {
                Image(systemName: "chevron.left")
            }
            .accentColor(.primary)
            Spacer()
                .frame(width: 120)
            Button {
                Next1()
            } label: {
                Image(systemName: "chevron.right")
            }
            .accentColor(.primary)
        }
    }
    var body: some View{
        Spacer()
        VStack {
            List(questionItems, children: \.textTwo) { item in
                Text(item.textOne)
                    .padding([.top, .bottom], 15)
            }
            .foregroundColor(.black)
            .clipped()
        }
    }
}

func q1() -> QuestionAnswer {
    return .init(textOne: "How can I change my Username?", textTwo: [.init(textOne: "Open the sidebar menu -> Tap Profile -> Edit your Username!")])
}

func q2() -> QuestionAnswer {
    return .init(textOne: "What is the purpose of this app?", textTwo: [.init(textOne: "To help athletes keep track of their activity and plan their next activity")])
}

func q3() -> QuestionAnswer {
    return .init(textOne: "Idk what a good question is", textTwo: [.init(textOne: "ill find a good answer")])
}

struct HelpCenterView_Previews: PreviewProvider {
    static var previews: some View {
        HelpCenterView()
    }
}

struct QuestionAnswer: Identifiable {
    let id = UUID()
    let textOne: String
    var textTwo: [QuestionAnswer]?
}

//
//  HelpCenterView.swift
//  Side Menu Test 2
//
//  Created by Victor Han on 2022/8/1.
//

import SwiftUI

struct HelpCenterView: View {
    let questionItems : [QuestionAnswer] = [ q1(), q2(), q3(), q4(), q5(), q6(), q7(), q8(), q9() ]
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
    return .init(textOne: "Who created this APP?", textTwo: [.init(textOne: "MILLAN and VICTOR !!!")])
}

func q2() -> QuestionAnswer {
    return .init(textOne: "When and Where was this APP made?", textTwo: [.init(textOne: "CTD 20220801-20220804 NorthWestern University Annenberg")])
}

func q3() -> QuestionAnswer {
    return .init(textOne: "Who is the most helpful in making this app besides the creators?", textTwo: [.init(textOne: "We are very grateful for Mr.Bredemeier's and Elise's help!")])
}

func q4() -> QuestionAnswer {
    return .init(textOne: "What is the purpose of this app?", textTwo: [.init(textOne: "To help athletes keep track of their activity and plan their next activity")])
}

func q5() -> QuestionAnswer {
    return .init(textOne: "How can I change my Username?", textTwo: [.init(textOne: "Open the sidebar menu -> Tap Profile -> Edit your Username!")])
}

func q6() -> QuestionAnswer {
    return .init(textOne: "How to use the Map feature?", textTwo: [.init(textOne: "Use the button on the top of the screen to select different sport fields. You can click the sign to link the website and get the direction")])
}

func q7() -> QuestionAnswer {
    return .init(textOne: "How to use the Calories Calculator feature?", textTwo: [.init(textOne: "Click + to add a record. Follow the guide words. Select the sport, enter your weight, time. Press calculate button to generate your burning calories. At last, click save")])
}
func q8() -> QuestionAnswer {
    return .init(textOne: "How to use the Activity feature?", textTwo: [.init(textOne: "Similar as the Calories Calc feature. Go there to see the instruction!")])
}
func q9() -> QuestionAnswer {
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

//
//  ContentView.swift
//  2022-07-27-swift-ui-dice-app
//
//  Created by JUNHYUN KANG on 2022/07/27.
//

import SwiftUI

struct ContentView: View {
    
    // @State wrapper, change screen when state update
    @State var leftDiceNumber = 1
    @State var centerDiceNumber = 2
    @State var rightDiceNumber = 3
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                
                Spacer()
                
                HStack {
                    DiceView(number: leftDiceNumber)
                    DiceView(number: centerDiceNumber)
                    DiceView(number: rightDiceNumber)
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    print("Click Roll")
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.centerDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                }) {
                    Text("Roll")
                        .foregroundColor(.white)
                        .font(
                            .system(size: 50)
                            .bold()
                        )
                        .padding(.horizontal)
                }
                .background(Color.red)
                .padding(.vertical)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}

struct DiceView: View {
    
    let number: Int
    
    var body: some View {
        Image("dice\(number)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
    }
}

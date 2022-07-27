//
//  ContentView.swift
//  2022-07-27-personal-card
//
//  Created by JUNHYUN KANG on 2022/07/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(uiColor: UIColor(red: 0.09, green: 0.63, blue: 0.52, alpha: 1.00))
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("pengsu")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                // .frame(width: 200, height: 200.0)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                    )
                Text("Junhyunny")
                    .font(.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("Fullstack Developer")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                Divider()
                InfoView(text: "+44 123 456 789", imageName: "phone.fill")
                InfoView(text: "kang3966@naver.com", imageName: "envelope.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

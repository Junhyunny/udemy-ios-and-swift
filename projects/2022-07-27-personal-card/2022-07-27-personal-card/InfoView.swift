//
//  InfoView.swift
//  2022-07-27-personal-card
//
//  Created by JUNHYUN KANG on 2022/07/27.
//

import Foundation
import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 50)
            .foregroundColor(.white)
            .padding(.all)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(.green)
                    Text(text)
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                }
            )
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Hello", imageName: "phone.fill")
            // size fit to component
            .previewLayout(.sizeThatFits)
    }
}

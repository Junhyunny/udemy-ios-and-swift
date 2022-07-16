//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by JUNHYUN KANG on 2022/07/16.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let title: String
    let result: String
    
    init(q: String, a: String) {
        self.title = q
        self.result = a
    }
}

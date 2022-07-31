//
//  StructExample.swift
//  2022-07-31-struct-versus-class
//
//  Created by JUNHYUN KANG on 2022/07/31.
//

import Foundation

// not error, automatically init
// 데이터 모델을 만들 때 struct를 사용하기를 추천
struct StructHero {
    var name: String
    var universe: String

    // mutating 키워드가 필요한 이유는 내부 프로퍼티 값을 바꾸는 행위는 새로운 객체를 만드는 행위이므로 표시 필요
    mutating func reverseName() {
        self.name = String(self.name.reversed())
    }
}

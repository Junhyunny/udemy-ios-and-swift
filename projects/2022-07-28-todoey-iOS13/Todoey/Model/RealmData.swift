//
//  Data.swift
//  Todoey
//
//  Created by JUNHYUN KANG on 2022/07/29.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class RealmData: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}

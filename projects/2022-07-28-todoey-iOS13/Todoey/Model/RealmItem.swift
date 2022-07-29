//
//  Item.swift
//  Todoey
//
//  Created by JUNHYUN KANG on 2022/07/29.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class RealmItem: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var createdAt: Date?
    var parentCategory = LinkingObjects<RealmCategory>(fromType: RealmCategory.self, property: "items")
}

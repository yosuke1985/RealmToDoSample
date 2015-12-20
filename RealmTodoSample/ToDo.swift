//
//  ToDo.swift
//  RealmTodoSample
//
//  Created by 中山 陽介 on 12/20/15.
//  Copyright © 2015 Yosuke Nakayama. All rights reserved.
//

import Foundation
import RealmSwift

class ToDo: Object {
    dynamic var name = ""
    dynamic var deadLine = NSDate(timeIntervalSince1970: 0)
    dynamic var isComplete = false

}
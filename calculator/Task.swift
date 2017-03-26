//
//  Task.swift
//  calculator
//
//  Created by ぽんじゅうす on 2017/03/25.
//  Copyright © 2017年 asa10yoru. All rights reserved.
//

import UIKit
import RealmSwift

class Task: Object {
    // 管理用 ID。プライマリーキー
    dynamic var id = 0
    
    // 値段
    dynamic var price = ""
    
    // メモ
    dynamic var note = ""
    
    
    /**
     id をプライマリーキーとして設定
     */
    override static func primaryKey() -> String? {
        return "id"
    }
}

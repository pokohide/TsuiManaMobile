//
//  Timedtext.swift
//  TsuiMana
//
//  Created by 酒井英伸 on 2016/04/18.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import Foundation
import SwiftyJSON


struct Timedtext {
    // MARK: - Properties
    var id: Int?
    var body: String?
    var half: Bool?
    var japanese: String?
    var start: Int?
    var userid: Int?
    var evideoid: Int?
    
    init(id: Int, body: String, half: Bool, japanese: String, start: Int, userid: Int, evideoid: Int) {
        self.id = id
        self.body = body
        self.half = half
        self.japanese = japanese
        self.start = start
        self.userid = userid
        self.evideoid = evideoid
    }
    
}
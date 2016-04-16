//
//  Evideo.swift
//  TsuiMana
//
//  Created by 酒井英伸 on 2016/04/09.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import Foundation

enum Category: String {
    case All = "TOP"
    case Letsplay = "ゲーム"
    case Funny = "おもしろい"
    case Girls = "ガールズ"
    case Benefit = "タメになる"
    case Other = "その他"

    static let values = [All, Letsplay, Funny, Girls, Benefit, Other].map { $0.rawValue }
}

class Evideo {
    var id: Int?
    var title: String?
    var videoId: String?
    var playtime: Int?
    var level: Int?
    var category: Category?
    var instant: Bool?
    var editable: Bool?
    var word: String?
    var view: Int?
    var imageUrl: NSURL?
    
    init(id: Int, title: String, videoId: String, playtime: Int, level: Int, category: String, instant: Bool, editable: Bool, word: String, view: Int) {
        self.id = id
        self.title = title
        self.videoId = videoId
        self.playtime = playtime
        self.level = level
        self.category = Category(rawValue: category)
        self.instant = instant
        self.editable = editable
        self.word = word
        self.view = view
        self.imageUrl =  NSURL(string: "http://i.ytimg.com/vi/\(videoId)/mqdefault.jpg")
    }
}

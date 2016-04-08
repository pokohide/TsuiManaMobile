//
//  EvideoResponse.swift
//  TsuiMana
//
//  Created by 酒井英伸 on 2016/04/09.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import Foundation
import ObjectMapper

class EvideoResponse: Mappable {
    var evideo: Evideo?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        evideo <- map["evideo"]
    }
}
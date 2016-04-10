//
//  EvideoFunction.swift
//  TsuiMana
//
//  Created by 酒井英伸 on 2016/04/11.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import Foundation

import UIKit
import Alamofire
import SwiftyJSON

class EvideoFunction {
    
    // APIを叩いて帰ってきたevideo一覧を処理する
    func getEvideos(url: String, completion:(([JSON]?, NSError?) -> Void)) {
        let url = NSURL(string: url)
        
        Alamofire.request(.GET, url!, parameters: nil, encoding: .JSON)
            .responseJSON { response in
                guard let object = response.result.value else {
                    return
                }
                print(object)
        
                //completion(evideos, error)
        }
    }
}
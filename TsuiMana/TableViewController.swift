//
//  TableViewController.swift
//  TsuiMana
//
//  Created by 酒井英伸 on 2016/04/08.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableViewController: UIViewController {
    
    
    //let parse = parseFeed()
    var url: String = String()
    var evideos: [JSON] = []
    var parent: UIViewController  = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //SVProgressHUD.show()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func getEvideos() {
//        Alamofire.request(.GET, fetchForm)
//            .responseJSON { response in
//                guard let object = response.result.value else {
//                    return
//                }
//                let json = JSON(object)
//                print(json)
//        }
//    }
    


}

//
//  ViewController.swift
//  TsuiMana
//
//  Created by 酒井英伸 on 2016/04/08.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import UIKit
import PageMenu
import Alamofire

class EvideoViewController: UIViewController {

    // MARK: - Properties
    let baseURL: String = "http://www.tsuimana.com/api/evideos"
    let categories: [Dictionary<String, String>] =
        [
            ["link": "/",
            "title": "TOP"],
            ["link": "/category/letsplay",
            "title": "ゲーム"],
            ["link": "/category/funny",
            "title": "おもしろ"],
            ["link": "/category/girls",
            "title": "ガールズ"],
            ["link": "/category/benefit",
            "title": "タメになる"],
            ["link": "/category/music",
            "title": "洋楽・映画"],
            ["link": "/category/other",
            "title": "その他"],
        ]
    var pageMenu : CAPSPageMenu?

    // MARK: - View life cycle
    override func viewDidLoad() {
        // スクロールメニュー
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orangeColor()]
        
        
        var categoryControllerArray: [UIViewController] = []
        for category in categories {
            let categoryController = EvideoTableViewController()
//            categoryController.parent = self
            categoryController.title = category["title"]!
            categoryControllerArray.append(categoryController)
        }
   
        let parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)),
            .SelectedMenuItemLabelColor(UIColor(red: 46.0/255.0, green: 125.0/255.0, blue: 50.0/255.0, alpha: 1.0)),
            .UnselectedMenuItemLabelColor (UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)),
            .ViewBackgroundColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)),
            .SelectionIndicatorColor(UIColor(red: 165.0/255.0, green: 214.0/255.0, blue: 167.0/255.0, alpha: 1.0)),
            .BottomMenuHairlineColor(UIColor(red: 207.0/255.0, green: 216.0/255.0, blue: 220.0/255.0, alpha: 1.0)),
            .MenuItemFont(UIFont(name: "HelveticaNeue", size: 13.0)!),
            .MenuHeight(40.0),
            .MenuItemWidth(80.0),
            .CenterMenuItems(true)
        ]

        pageMenu = CAPSPageMenu(viewControllers: categoryControllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        pageMenu!.didMoveToParentViewController(self)
    }

}

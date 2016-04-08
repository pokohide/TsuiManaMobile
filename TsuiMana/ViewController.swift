//
//  ViewController.swift
//  TsuiMana
//
//  Created by 酒井英伸 on 2016/04/08.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import UIKit
import PageMenu

class ViewController: UIViewController {
        
    var categories: [Dictionary<String, String>] =
        [
            ["link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/top/rss",
            "title": "all"],
            ["link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/ruby/rss",
            "title": "ruby"],
            ["link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/ios/rss",
            "title": "ios"],
            ["link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/infrastructure/rss",
            "title": "infrastructure"],
            ["link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/top/rss",
                "title": "all"],
            ["link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/ruby/rss",
                "title": "ruby"],
            ["link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/ios/rss",
                "title": "ios"],
        ]
    
    
    var pageMenu : CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // スクロールメニュー
        self.title = "ついまな"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orangeColor()]
        
        
        //let iconHome = UIBarButtonItem(image: UIImage(named: "menu.png"), style: .Plain, target: self, action: "onMenu:")
        //self.navigationItem.leftBarButtonItem = iconHome
        
        
        var categoryControllerArray: [UIViewController] = []
        
        let allEvideos: UIViewController = UIViewController(nibName: "CategoryViewController", bundle: nil)
        allEvideos.title = "全て"
        categoryControllerArray.append(allEvideos)
        
        let gameEvideos: UIViewController = UIViewController(nibName: "CategoryViewController", bundle: nil)
        gameEvideos.title = "ゲーム"
        categoryControllerArray.append(gameEvideos)
        
        let funnyEvideos: UIViewController = UIViewController(nibName: "CategoryViewController", bundle: nil)
        funnyEvideos.title = "おもしろ"
        categoryControllerArray.append(funnyEvideos)
        
        let girlsEvideos: UIViewController = UIViewController(nibName: "CategoryViewController", bundle: nil)
        girlsEvideos.title = "ガールズ"
        categoryControllerArray.append(girlsEvideos)
        
        let benefitEvideos: UIViewController = UIViewController(nibName: "CategoryViewController", bundle: nil)
        benefitEvideos.title = "タメになる"
        categoryControllerArray.append(benefitEvideos)
        
        let musicEvideos: UIViewController = UIViewController(nibName: "CategoryViewController", bundle: nil)
        musicEvideos.title = "洋楽・映画"
        categoryControllerArray.append(musicEvideos)
        
        let otherEvideos: UIViewController = UIViewController(nibName: "CategoryViewController", bundle: nil)
        otherEvideos.title = "その他"
        categoryControllerArray.append(otherEvideos)

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
        
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: categoryControllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        
        pageMenu!.didMoveToParentViewController(self)
    }
    
    func onMenu(sender: UIButton) {
        self.slideMenuController()?.openLeft()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


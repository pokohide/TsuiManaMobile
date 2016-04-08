//
//  TabBarController.swift
//  TsuiMana
//
//  Created by 酒井英伸 on 2016/04/09.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    var navController: UINavigationController!
    var navController2: UINavigationController!
    var navController3: UINavigationController!
    var navController4: UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let vc = ViewController()
        navController = UINavigationController(rootViewController: vc)
        
        let vc2 = ViewController()
        navController2 = UINavigationController(rootViewController: vc2)
        
        let vc3 = ViewController()
        navController3 = UINavigationController(rootViewController: vc3)
        
        let vc4 = ViewController()
        navController4 = UINavigationController(rootViewController: vc4)
        
        // タブ画像設定
        navController.tabBarItem.image = UIImage(named: "icon.png")
        navController2.tabBarItem.image = UIImage(named: "icon.png")
        navController3.tabBarItem.image = UIImage(named: "icon.png")
        navController4.tabBarItem.image = UIImage(named: "icon.png")
        
        // タブタイトル設定
        navController.tabBarItem.title = "あいうえお"
        navController2.tabBarItem.title = "かきくけこ"
        navController3.tabBarItem.title = "さしすせそ"
        navController4.tabBarItem.title = "たちつてと"
        
        let tabs = NSArray(objects: navController, navController2, navController3, navController4)
        self.setViewControllers(tabs as? [UIViewController], animated: true)
    }
}
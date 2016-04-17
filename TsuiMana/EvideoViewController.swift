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
    var pageMenu : CAPSPageMenu?

    // MARK: - View life cycle
    override func viewDidLoad() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orangeColor()]

        var controllers = [UIViewController]()
        Category.values.forEach {
            let controller = EvideoTableViewController()
            controller.category = Category(rawValue: $0)
            controllers.append(controller)
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

        pageMenu = CAPSPageMenu(viewControllers: controllers, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)

        guard let pageMenu = pageMenu else { return }
        addChildViewController(pageMenu)
        view.addSubview(pageMenu.view)
        pageMenu.didMoveToParentViewController(self)
    }

}

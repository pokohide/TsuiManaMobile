//
//  EvideoShowViewController.swift
//  TsuiMana
//
//  Created by 酒井英伸 on 2016/04/18.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import UIKit

class EvideoShowViewController: UIViewController {
    
    // MARK: - Properties
    var evideo: Evideo? {
        didSet {
//            print(evideo?.title)
//            // TODO: SDWebImageを使う
//            if let url = evideo?.imageUrl {
//                do {
//                    //let imageData = try NSData(contentsOfURL: url, options: .DataReadingMappedIfSafe)
//                } catch {
//                    print("Error: can't create image.")
//                }
//            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func loadView() {
        if let view = UINib(nibName: "EvideoShowViewController", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
//
//  EvideoTableViewController.swift
//  TsuiMana
//
//  Created by 酒井英伸 on 2016/04/10.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import UIKit
import SwiftyJSON

class EvideoTableViewController: UITableViewController {
    
    let eFunction = EvideoFunction()
    var url: String = String()
    var evideos: [JSON] = []
    var parent: UIViewController  = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ローディング画面
        // SVProgressHUD.show()
        
        let nib: UINib = UINib(nibName: "EvideoViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "Cell")
        
        eFunction.getEvideos(self.url, completion: {(data, erorr) in
            self.evideos = data!
            self.tableView.reloadData()
            // ローディンフ画面消去
            // SVProgressHUD.dismiss()
            
        })

        //self.tableView.addPullTorRefresh({ [weak self] in
        //    self?.tableView.reloadData()
        //    self?.tableView.stopPullToRefresh()
        //)}
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return self.evideos.count
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! EvideoViewCell
        
        //cell.title.text = self.evideos[indexPath.row]["title"].string
        cell.title.text = "aaa"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        //return 高さ
        return 100
    }
    
    func dispatch_async_main(block: () -> ()) {
        dispatch_async(dispatch_get_main_queue(), block)
    }
    
    func dispatch_async_global(block: () -> ()) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
    }
    
}

//extension EvideoTableViewController: UITableViewDelegate {
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let evideoViewController = EvideoViewController()
//        evideoViewController.evideo = self.evideos[indexPath.row].dictionary!
//        parent.navigationController!.pushViewController(evideoController, animated: true)
//    }
//}


//        var contents = ""
//        var image = ""
//        cell.contents.text = ""
//        cell.img.image = UIImage(named:"Picture")!
//        
//        parse.getContents(self.entries[indexPath.row]["link"].string!, completion: { (data, error) in
//            
//            contents = data["content"] as! String
//            cell.contents.text = contents
//            
//            image = data["image"] as! String
//            
//            if(image != ""){
//                
//                self.dispatch_async_global {
//                    let url = NSURL(string: image)
//                    var err: NSError?;
//                    var imageData :NSData = NSData(contentsOfURL: url!, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &err)!
//                    
//                    self.dispatch_async_main {
//                        cell.img.image = UIImage(data:imageData)!
//                        cell.layoutSubviews()
//                    }
//                }
//                
//            }else{
//                cell.img.image = UIImage(named:"Picture")!
//            }
//        })
//        
//        return cell
//        
//    }
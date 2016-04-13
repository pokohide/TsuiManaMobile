//
//  EvideoTableViewController.swift
//  TsuiMana
//
//  Created by 酒井英伸 on 2016/04/10.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class EvideoTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    let eFunction = EvideoFunction()
    var url: String = String()
    var evideos: [Evideo] = []
    //var parent: UIViewController = UIViewController()
    var is_loading: Bool = true
    var has_next: Bool = true
    var current_page: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ローディング画面
        // SVProgressHUD.show()
        
        // ローディング画面表示
        fetchData(true, completion: {
            print(self.evideos)
            // ローディング画面非表示に
        })
        
        //let nib: UINib = UINib(nibName: "EvideoViewCell", bundle: nil)
        //self.tableView.registerNib(nib, forCellReuseIdentifier: "Cell")
        
        //eFunction.getEvideos(self.url, completion: {(data, erorr) in
            //self.evideos = data!
            //self.tableView.reloadData()
            // ローディンフ画面消去
            // SVProgressHUD.dismiss()
            
        //})

        //self.tableView.addPullTorRefresh({ [weak self] in
        //    self?.tableView.reloadData()
        //    self?.tableView.stopPullToRefresh()
        //)}
        
    }
        
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let maxOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if( maxOffset - offset) <= 0 {
            fetchData(false, completion: { print("ok") })
        }
    }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! EvideoViewCell
        cell.evideo = evideos[indexPath.row]
        cell.setCell()
        return cell
    }
        

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.evideos.count ?? 0
    }
        
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        //return 高さ
        return 200
    }
        
    // クリックしたら
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //let cell = tableView.cellForRowAtIndexPath(indexPath) as! ClubListViewCell
        //self.performSegueWithIdentifier("showClub", sender: cell)
        print(indexPath)
    }
    
    func dispatch_async_main(block: () -> ()) {
        dispatch_async(dispatch_get_main_queue(), block)
    }
    
    func dispatch_async_global(block: () -> ()) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 動画をAPI経由で取得する
    func fetchData(initialize: Bool, completion: ( () -> Void)) {
        if self.is_loading && (initialize || has_next) {
            self.is_loading = true
            if initialize {
                self.current_page = 1
            }
            let URL = NSURL(string: self.url + "/?page=/(current_page++)")
            
            // ここでAUTH_TOKENを設定している
            //var mutableURLRequest = NSMutableURLRequest(URL: URL!)
            //mutableURLRequest.HTTPMethod = "GET"
            //mutableURLRequest.setValue(app.AUTH_TOKEN, forHTTPHeaderField: "Authorization")
            //var manager = Manager.sharedInstance
            //var request = manager.request(mutableURLRequest)
            
            Alamofire.request(.GET, URL!, parameters: nil, encoding: .JSON)
                .responseJSON{ response in
                    switch response.result {
                    case .Success(let value): // 通信成功時
                        let json = JSON(value)  // 正しくはSwiftyJSON.JSON
                        for(_, data) in json["response"]["evideos"] {
                            let evideo = Evideo(
                                id: data["id"].int!,
                                title: data["title"].string!,
                                videoId: data["youtube"].string!,
                                //playtime: data["playtime"].int!,
                                playtime: 0,
                                level: data["level"].int!,
                                category: data["category"].string!,
                                instant: data["instant"].bool!,
                                editable: data["editable"].bool!,
                                word: data["word"].string!,
                                view: data["view"].int!)
                            // SwiftyJSON2の文法で int! → intValue. string! → stringValueにするらしい
                            self.evideos.append(evideo)
                        }
                        self.has_next = json["response"]["paginator"]["has_next"].bool!
                        self.is_loading = false
                        //self.tableView.reloadData()
                        print("\(self.url)を取得")
                        print(self.evideos)
                        break
                    default:
                        break
                    }
            }
            completion()
        }
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
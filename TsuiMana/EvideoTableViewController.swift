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

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    let eFunction = EvideoFunction()
    var url = ""
    var evideos: [Evideo] = []
    var is_loading: Bool = true
    var has_next: Bool = true
    var current_page: Int = 1

    // MARK: - View life cycle
    override func viewDidLoad() {
        fetchData(true, completion: {
            print(self.evideos)
        })
    }

    // MARK: - Publics
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
        return cell
    }
        

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.evideos.count ?? 0
    }
        
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //let cell = tableView.cellForRowAtIndexPath(indexPath) as! ClubListViewCell
        //self.performSegueWithIdentifier("showClub", sender: cell)
        print(indexPath)
    }

    // MARK: - Privates
    private func fetchData(initialize: Bool, completion: ( () -> Void)) {
        if self.is_loading && (initialize || has_next) {
            self.is_loading = true
            if initialize {
                self.current_page = 1
            }
            let URL = NSURL(string: self.url + "/?page=/(current_page++)")
            
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

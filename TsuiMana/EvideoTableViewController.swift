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

class EvideoTableViewController: UITableViewController {

    // MARK: - Outlets

    // MARK: - Properties
    var evideos = [Evideo]()
    var is_loading = false
    var current_page = 1

    // MARK: - View life cycle
    override func viewDidLoad() {
        tableView.registerClass(EvideoTableViewCell.self, forCellReuseIdentifier: "Cell")
        fetchData(true)
    }

    // MARK: - Publics
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let maxOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if (maxOffset - offset) <= 0 {
            fetchData(false)
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! EvideoTableViewCell
        cell.evideo = evideos[indexPath.row]
        return cell
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.evideos.count ?? 0
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //let cell = tableView.cellForRowAtIndexPath(indexPath) as! ClubListViewCell
        //self.performSegueWithIdentifier("showClub", sender: cell)
        print(indexPath)
    }

    // MARK: - Privates
    private func fetchData(initialize: Bool) {
        if !is_loading {
            self.is_loading = true

            if initialize {
                self.current_page = 1
                self.evideos = [Evideo]()
            }

            WebAPIClient().getAllEvideos(current_page) { result in
                switch result {
                case .Success(let evideos):
                    evideos.forEach { self.evideos.append($0) }
                    self.tableView.reloadData()
                    self.current_page += 1
                case .Failure(let error):
                    print(error)
                }
                self.is_loading = false
            }
        }
    }
    
}

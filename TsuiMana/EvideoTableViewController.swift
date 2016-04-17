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
    var isLoading = false
    var page = 1

    // MARK: - View life cycle
    override func viewDidLoad() {
        tableView.registerNib(UINib(nibName: "EvideoTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
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
        return 120
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //let cell = tableView.cellForRowAtIndexPath(indexPath) as! ClubListViewCell
        //self.performSegueWithIdentifier("showClub", sender: cell)
        print(indexPath)
    }

    // MARK: - Privates
    private func fetchData(initialize: Bool) {
        if !isLoading {
            isLoading = true

            if initialize {
                self.page = 1
                self.evideos = [Evideo]()
            }

            WebAPIClient().getAllEvideos(page) { result in
                switch result {
                case .Success(let evideos):
                    evideos.forEach { self.evideos.append($0) }
                    self.tableView.reloadData()
                    self.page += 1
                case .Failure(let error):
                    print(error)
                }
                self.isLoading = false
            }
        }
    }
    
}

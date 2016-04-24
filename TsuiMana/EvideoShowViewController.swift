//
//  EvideoShowViewController.swift
//  TsuiMana
//
//  Created by 酒井英伸 on 2016/04/18.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import UIKit
import SVProgressHUD
import YouTubePlayer

class EvideoShowViewController: UIViewController {
    
    private var isLoading = false
    var timedtexts = [Timedtext]()
    
    // MARK: - Properties
    var evideoId: Int? = 0
    //let ytPlayerView = YouTubePlayerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        //fetchData(true)
    }

    override func loadView() {
        if let view = UINib(nibName: "EvideoShowViewController", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
            //ytPlayerView.frame = CGRectMake(0.0, 0.0, self.view.frame.width, 200)
            //self.view.addSubview(ytPlayerView)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Privates
    private func fetchData(initialize: Bool) {
        if !isLoading {
            isLoading = true
            SVProgressHUD.show()
            
            if initialize {
                self.timedtexts = [Timedtext]()
            }
            if let id = self.evideoId {
                WebAPIClient().getEvideo(id) { result in
                    switch result {
                    case .Success(let evideo):
                        if let videoId = evideo.videoId {
                            //self.ytPlayerView.loadVideoID(videoId)
                            print(videoId)
                        }
                    case .Failure(let error):
                        print(error)
                    }
                    SVProgressHUD.dismiss()
                    self.isLoading = false
                }
            }
        }
    }

}
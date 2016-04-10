//
//  EvideoViewCell.swift
//  TsuiMana
//
//  Created by 酒井英伸 on 2016/04/10.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import UIKit

class EvideoViewCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var word: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(evideo: Evideo) {

        // youtubeのサムネイルを非同期でロード
        let imageRequest = NSURLRequest(URL: evideo.imageUrl!)
        
        NSURLConnection.sendAsynchronousRequest(imageRequest, queue:NSOperationQueue.mainQueue()) {
            (res, data, err) in
            let image = UIImage(data: data!)
            self.thumbnail.image = image
        }
        self.title.text = evideo.title
        self.word.text = evideo.word
    }

}
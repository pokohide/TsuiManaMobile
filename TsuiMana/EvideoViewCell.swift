//
//  EvideoViewCell.swift
//  TsuiMana
//
//  Created by 酒井英伸 on 2016/04/10.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import UIKit

class EvideoViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var word: UILabel!

    // MARK: - Properties
    var evideo: Evideo?

    // MARK: - View life cycle
    override func awakeFromNib() {
        // TODO: SDWebImageを使う
        if let url = evideo?.imageUrl {
            do {
                let imageData = try NSData(contentsOfURL: url, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                thumbnail.image = UIImage(data: imageData)
            } catch {
                print("Error: can't create image.")
            }
        }

        title.text = evideo?.title
        word.text = evideo?.word
    }
}
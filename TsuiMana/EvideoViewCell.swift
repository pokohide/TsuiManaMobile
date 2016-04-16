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
    
    var evideo: Evideo? {
        didSet {
            // TODO: SDWebImageを使う
            if let url = evideo?.imageUrl {
                do {
                    let imageData = try NSData(contentsOfURL: url, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                    self.thumbnail.image = UIImage(data: imageData)
                } catch {
                    print("Error: can't create image.")
                }
            }
            
            self.title.text = self.evideo?.title
            self.word.text = self.evideo?.word
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell() {
        print(evideo)
        let url: NSURL = (self.evideo!.imageUrl!)
        let imageData: NSData
        do {
            imageData = try NSData(contentsOfURL: url,options: NSDataReadingOptions.DataReadingMappedIfSafe)
            self.thumbnail.image = UIImage(data: imageData)
            
        } catch {
            print("Error: can't create image.")
            
        }
        
        self.title.text = self.evideo!.title
        self.word.text = self.evideo!.word
    }

}
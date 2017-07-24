//
//  MGItemSettingSwitchTableViewCell.swift
//  MangaProject
//
//  Created by Bui Giang on 7/25/17.
//  Copyright © 2017 Bui Giang. All rights reserved.
//

import UIKit

class MGItemSettingSwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var iconRightButtom: UIButton!
    @IBOutlet weak var titleLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCell(title:String,imageName: ImageIconRight) {
        self.titleLable.text = title
        self.iconRightButtom.setImage(UIImage( named: imageName.rawValue), for: .normal)
    }
    func configCellTextButtom(title:String,infor:String) {
        self.titleLable.text = title
        self.iconRightButtom.setTitle(infor, for: .normal)
        self.iconRightButtom.setImage(UIImage( named: ""), for: .normal)
    }
    
    @IBAction func actionOnclickIcon(_ sender: Any) {
    
    }
}

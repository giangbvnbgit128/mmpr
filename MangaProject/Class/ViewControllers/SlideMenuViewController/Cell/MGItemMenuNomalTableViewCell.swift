//
//  MGItemMenuNomalTableViewCell.swift
//  MangaProject
//
//  Created by Bui Giang on 7/24/17.
//  Copyright © 2017 Bui Giang. All rights reserved.
//

import UIKit

class MGItemMenuNomalTableViewCell: MGBaseTableViewCell {
    @IBOutlet weak var avartaImage: UIImageView!
    @IBOutlet weak var titleLable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func configCell(title:String,imageName:String) {
        self.avartaImage.image = UIImage(named: imageName)
        self.titleLable.text = title
    }
}

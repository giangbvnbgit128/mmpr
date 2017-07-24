//
//  MGLeftMenuViewController.swift
//  MangaProject
//
//  Created by Bui Giang on 7/20/17.
//  Copyright © 2017 Bui Giang. All rights reserved.
//

import UIKit

class MGLeftMenuViewController: MGBaseViewController {

    @IBOutlet weak var spacingTopMenuContraint: NSLayoutConstraint!
    @IBOutlet weak var spacingRightLeftMenuNSContraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.spacingRightLeftMenuNSContraint.constant = setupSpacingRight()//90 * Ratio.widthIPhone6
        self.spacingTopMenuContraint.constant = UIScreen.mainHeight * 0.1 * 0.5

    }

    func setupSpacingRight() -> CGFloat {
    
        if ScreenSize.iSIPhone4OrLess {
            return 30
        } else if ScreenSize.IsIPhone5 {
            return 55
        } else if ScreenSize.IsIPhone6 {
            return 80
        } else {
            return 90 * Ratio.widthIPhone6
        }
        
        return 1.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

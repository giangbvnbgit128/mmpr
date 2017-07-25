//
//  MGLeftMenuViewController.swift
//  MangaProject
//
//  Created by Bui Giang on 7/20/17.
//  Copyright © 2017 Bui Giang. All rights reserved.
//

import UIKit

class MGLeftMenuViewController: MGBaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spacingTopMenuContraint: NSLayoutConstraint!
    @IBOutlet weak var spacingRightLeftMenuNSContraint: NSLayoutConstraint!
    let arrTitleMenu:[String] = ["Truyện đã tải","Cài đặt","Bình luận","Đăng nhập"]
    let arrNameImage:[String] = ["downloadnavleft","setting-nav-left","comment_rate","logout-nav-left"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.spacingRightLeftMenuNSContraint.constant = setupSpacingRight()
        self.spacingTopMenuContraint.constant = UIScreen.mainHeight * 0.1 * 0.5
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
        tableView.registerCellNib(MGProfileTableViewCell.self)
        tableView.registerCellNib(MGStaticticalTableViewCell.self)
        tableView.registerCellNib(MGKidLockTableViewCell.self)
        tableView.registerCellNib(MGItemMenuNomalTableViewCell.self)
        

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
    }
    

}
extension MGLeftMenuViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50 * Ratio.widthIPhone6
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row > 2 {
            var viewVC:UIViewController = UIViewController()
            switch indexPath.row - 3 {
            case 0:
                viewVC = MGDownloadListViewController()
            case 1:
                viewVC = MGSettingViewController()
            case 2:
                viewVC = MGCommentViewController()
            default:
                break
            }
            self.present(viewVC, animated: true, completion: {
                
            })
        }
    }
}
extension MGLeftMenuViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeue(MGProfileTableViewCell.self)
            return cell
        case 1:
            let cell = tableView.dequeue(MGStaticticalTableViewCell.self)
            return cell
        case 2:
            let cell = tableView.dequeue(MGKidLockTableViewCell.self)
            return cell
        default:
            let cell = tableView.dequeue(MGItemMenuNomalTableViewCell.self)
            if indexPath.row >= 3 {
               cell.configCell(title: self.arrTitleMenu[indexPath.row - 3] , imageName: arrNameImage[indexPath.row - 3])
            }
            return cell
        }
    }
}

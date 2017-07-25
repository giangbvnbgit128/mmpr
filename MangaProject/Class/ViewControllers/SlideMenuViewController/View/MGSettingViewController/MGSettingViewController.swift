//
//  MGSettingViewController.swift
//  MangaProject
//
//  Created by Bui Giang on 7/25/17.
//  Copyright © 2017 Bui Giang. All rights reserved.
//

import UIKit


enum ImageIconRight:String {
    case ImageSwitchoff = "switch-off"
    case ImageSwitchon = "switch-on"
    case ImageArrow = "arrow_gray"
    case ImageNomal = "NULL"
}

class MGSettingViewController: MGBaseViewController {

    let arrTitleHeader:[String] = ["Tải truyện","Bảo mật","Trung tâm thông báo","Phản hồi","Hệ thống"]
    let arrDownload:[String] = ["Chỉ tải bằng wifi","Xoá cache","Xoá danh sách truyện vừa đọc"]
    let arrCenterInformation:[String] = ["Thông báo khi có tập mới"]
    let arrSystemSetting:[String] = ["Phiên bản","Build","Ngôn ngữ","About"]
    let arrSecurity:[String] = ["Mật khẩu","Tạo mật khẩu"]
    let arrFeedback:[String] = ["Phản hồi"]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerCellNib(MGHeaderSettingTableViewCell.self)
        tableView.registerCellNib(MGItemSettingSwitchTableViewCell.self)
        tableView.registerCellNib(MGSettingInforTableViewCell.self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionCloseViewController(_ sender: Any) {
    }
}
extension MGSettingViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.arrTitleHeader.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return self.arrDownload.count
        case 1:
            return self.arrSecurity.count
        case 2:
            return self.arrCenterInformation.count
        case 3:
            return self.arrFeedback.count
        case 4:
            return arrSystemSetting.count
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40 * Ratio.widthIPhone6
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50 * Ratio.widthIPhone6
    }
}
extension MGSettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeue(MGItemSettingSwitchTableViewCell.self)
        var title:String = ""
        var imageName:ImageIconRight = .ImageNomal
        switch indexPath.section {
        case 0:
            title = arrDownload[indexPath.row]
            switch indexPath.row {
            case 0:
               imageName = .ImageSwitchoff
            default:
                imageName = .ImageNomal
            }
        case 1:
            title = arrSecurity[indexPath.row]
            switch indexPath.row {
            case 1:
                imageName = .ImageArrow
            default:
                imageName = .ImageSwitchoff
            }
        case 2:
           title = arrCenterInformation[indexPath.row]
            imageName = .ImageSwitchoff
        case 3:
            title = arrFeedback[indexPath.row]
            imageName  = .ImageNomal
        default:
            title = arrSystemSetting[indexPath.row]
            cell.configCellTextButtom(title: title, infor: "1.1")
            return cell
        }
        cell.configCell(title:title, imageName: imageName)
        return cell
    }
    
}

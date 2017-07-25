//
//  MGDownloadListViewController.swift
//  MangaProject
//
//  Created by Bui Giang on 7/25/17.
//  Copyright © 2017 Bui Giang. All rights reserved.
//

import UIKit

class MGDownloadListViewController: MGBaseViewController {

    @IBOutlet weak var titleTopviewLable: UILabel!
    @IBOutlet weak var viewadsButtom: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewadsButtom.layer.cornerRadius = 4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionWhatchAds(_ sender: Any) {
    }
    
    @IBAction func actionCloseViewController(_ sender: Any) {
        self.dismiss(animated: true) { 
            //todo
        }
    }

    @IBAction func actionDeleteItem(_ sender: Any) {
    }
}

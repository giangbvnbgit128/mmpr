//
//  AVMainViewController.swift
//  AnViet
//
//  Created by Bui Giang on 5/28/17.
//  Copyright © 2017 Bui Giang. All rights reserved.
//

import UIKit
import AKSideMenu

class MGMainViewController: UIViewController, UITabBarDelegate, CAPSPageMenuDelegate {
    @IBOutlet weak var tabBarView: UITabBar!
    var pageMenu: CAPSPageMenu?
    @IBOutlet weak var nsContraintHeightTabbar: NSLayoutConstraint!
    
    @IBOutlet weak var discoverTab: UITabBarItem!
    @IBOutlet weak var newestTab: UITabBarItem!
    @IBOutlet weak var topViewTab: UITabBarItem!
    @IBOutlet weak var categoryTab: UITabBarItem!
    @IBOutlet weak var labriTab: UITabBarItem!
    
    
    var blockReloadData:(()->Void)?
    struct Static {
        static var instance: MGMainViewController?
    }
    class var ShareInstance: MGMainViewController {
        if Static.instance == nil {
            Static.instance = MGMainViewController()
        }
        return Static.instance!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarView.isTranslucent = false
        self.setUpTabBar()
        tabBarView.delegate = self
        tabBarView.selectedItem = discoverTab
        navigationController?.navigationBar.barTintColor = UIColor.MGColorNavigationbar()
        Static.instance = self
        self.setRightBarIconParent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setUpTabBar() {
        
        self.tabBarView.tintColor = UIColor.red
        
        let dicoverVC       = MGDiscoverViewController()
        let newestVC        = MGNewestViewController()
        let toplistVC       = MGTopViewController()
        let categorylistVC  = MGCategoryViewController()
        let labriVC         = MGLabriViewController()
        let controllerArray = [ MGBaseNavigationController(rootViewController: dicoverVC),
                                MGBaseNavigationController(rootViewController: newestVC),
                                MGBaseNavigationController(rootViewController: toplistVC),
                                MGBaseNavigationController(rootViewController: categorylistVC),
                                MGBaseNavigationController(rootViewController: labriVC)
                                ]
        let parameters: [CAPSPageMenuOption] = [
            .scrollMenuBackgroundColor(UIColor(hex: "313131")),
            .viewBackgroundColor(UIColor.white),
            .selectionIndicatorColor(UIColor(hex: "13b2e2")),
            .selectedMenuItemLabelColor(UIColor(hex: "13b2e2")),
            .addBottomMenuHairline(true),
            .menuItemFont(CCFont(.HiraKakuPro, .W6, 10)),
            .menuHeight(0),
            .selectionIndicatorHeight(0.0),
            .selectionIndicatorHeight(2.0),
            .bottomMenuHairlineColor(UIColor.clear),
            .centerMenuItems(true),
            .menuItemWidth(UIScreen.mainWidth/6),
            .menuMargin(1),
            .menuItemMargin(1)
        ]
        
        let heightTopView = self.heightStatusBar() + (navigationController?.navigationBar.frame.height ?? 0)
        
        let framePapeMenu = CGRect(x: 0, y: heightTopView, width: self.view.bounds.width, height: self.view.bounds.height - heightTopView - self.tabBarView.frame.height)
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: framePapeMenu, pageMenuOptions: parameters)
        pageMenu?.delegate = self
        if let pageMenu = pageMenu {
            self.view.addSubview(pageMenu.view)
        }
        
        
    }
    
    // MARK: - Setup
    func setRightBarIconParent() {
        let leftButton = UIButton(type: .custom)
        leftButton.addTarget(self, action: #selector(self.clickRightButtom), for: .touchUpInside)
        leftButton.frame = CGRect(x: -15, y: -5, width: 50, height: 50)
        leftButton.setImage(UIImage(named: "action"), for: .normal)
        leftButton.contentMode = .scaleAspectFit
        let leftView = UIView(x: 0, y: 0, width: 50, height: 50)
        leftView.addSubview(leftButton)
        self.navigationItem.setLeftBarButton(UIBarButtonItem(customView: leftView), animated: false)
    }
    
    func clickRightButtom()  {
        self.sideMenuViewController?.presentLeftMenuViewController()
    }
    
    func didMoveToPage(_ controller: UIViewController, index: Int) {
        switch index {
        case 0:
            tabBarView.selectedItem = discoverTab
        case 1:
            tabBarView.selectedItem = newestTab
        case 2:
            tabBarView.selectedItem = topViewTab
        case 3:
            tabBarView.selectedItem = categoryTab
        default:
            tabBarView.selectedItem = labriTab
        }
    }

    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
         pageMenu?.moveToPage(item.tag)
    }
    
}

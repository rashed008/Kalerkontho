//
//  MenuViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Ashish on 21/09/15.
//  Copyright (c) 2015 Kode. All rights reserved.
//

import UIKit

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(index : Int32)
}

class MenuVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /**
    *  Array to display menu options
    */
    @IBOutlet var tblMenuOptions : UITableView!
    
    /**
    *  Transparent button to hide menu
    */
    @IBOutlet var btnCloseMenuOverlay : UIButton!
    
    /**
    *  Array containing menu options
    */
    var arrayMenuOptions = [Dictionary<String,String>]()
    
    /**
    *  Menu button which was tapped to display the menu
    */
    var btnMenu : UIButton!
    
    /**
    *  Delegate of the MenuVC
    */
    var delegate : SlideMenuDelegate?
    
    var selectedMenu : UIButton?
    
    var menuList = [MenuModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMenuOptions.tableFooterView = UIView()

        tblMenuOptions.registerNib(UINib(nibName: "MenuTableCell", bundle: nil), forCellReuseIdentifier: "MenuTableCell")
        tblMenuOptions.registerNib(UINib(nibName: "MenuSectionHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "MenuSectionHeader")
        
        getMenuList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateArrayMenuOptions()
    }
    
    func updateArrayMenuOptions(){
        arrayMenuOptions.append(["title":"Home", "icon":"HomeIcon"])
        arrayMenuOptions.append(["title":"Play", "icon":"PlayIcon"])
        
        tblMenuOptions.reloadData()
    }
    
    @IBAction func onCloseMenuClick(button:UIButton!){
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.view.frame = CGRectMake(-UIScreen.mainScreen().bounds.size.width, 0, UIScreen.mainScreen().bounds.size.width,UIScreen.mainScreen().bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clearColor()
            }, completion: { (finished) -> Void in
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
        })
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuTableCell") as! MenuTableCell
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.colorFromString(hexString: AppConstant.Config.DefaultColorCode)
        cell.selectedBackgroundView = bgColorView
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model = menuList[section]
        
        return model.isExpanded ? model.expandableList.count : 0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return menuList.count
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterViewWithIdentifier("MenuSectionHeader") as! MenuSectionHeader
        
        let model = menuList[section]
        
        header.headerLabel.text = model.name
        
        header.contentView.backgroundColor = UIColor.blackColor()
        header.menuSelectionButton.addTarget(self, action: #selector(menuSetionButtonPressed), forControlEvents: UIControlEvents.TouchUpInside)
        return header
    }
    
    
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let btn = UIButton(type: UIButtonType.Custom)
//        btn.tag = indexPath.row
//        self.onCloseMenuClick(btn)
//    }
//  
//    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1;
//    }
//    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 44
//    }
    
    //------------------------------------------------------
    //MARK:- HeaderSelectioinButtonAction
    //------------------------------------------------------
    
    func getMenuList() {
        var menuModel = MenuModel()
        menuModel.name = "হোম"
        menuList.append(menuModel)
        
        menuModel = MenuModel()
        menuModel.name = "শীর্ষ সংবাদ"
        menuList.append(menuModel)
        
        menuModel = MenuModel()
        menuModel.name = "সর্বশেষ সংবাদ"
        menuList.append(menuModel)
        
        menuModel = MenuModel()
        menuModel.name = "সর্বাধিক পঠিত"
        menuList.append(menuModel)
        
        menuModel = MenuModel()
        menuModel.name = "রিন্ট ভার্সন"
        menuList.append(menuModel)
        
        menuModel = MenuModel()
        menuModel.name = "নির্বাচিত সংবাদ"
        menuList.append(menuModel)
        
        menuModel = MenuModel()
        menuModel.name = "সকল সংবাদ"
        menuList.append(menuModel)
        
        menuModel = MenuModel()
        menuModel.name = "নির্বাচিত ক্যাটাগরি"
        menuList.append(menuModel)
        
        menuModel = MenuModel()
        menuModel.name = "ফেবোরাইট"
        menuList.append(menuModel)
        
        menuModel = MenuModel()
        menuModel.name = "ফটো গ্যালারি"
        menuList.append(menuModel)
        
        menuModel = MenuModel()
        menuModel.name = "সেটিংস"
        menuList.append(menuModel)
        
        menuModel = MenuModel()
        menuModel.name = "মতামত"
        menuList.append(menuModel)
        
    }
    
    //------------------------------------------------------
    //MARK:- HeaderSelectioinButtonAction
    //------------------------------------------------------
    
    func menuSetionButtonPressed(sender: UIButton)  {
        
        if selectedMenu != sender {
            if selectedMenu != nil {
                selectedMenu?.backgroundColor = UIColor.clearColor()
            }
            selectedMenu = sender
            selectedMenu?.backgroundColor = UIColor.colorFromString(hexString: AppConstant.Config.DefaultColorCode)
        }
    }
}
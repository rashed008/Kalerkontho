//
//  KKSessionManager.swift
//  KalerKantho
//
//  Created by MAC on 8/18/16.
//  Copyright © 2016 AAPBD. All rights reserved.
//

import UIKit

class KKSessionManager: Mappable {
    
    var sideMenuList = [MenuModel]()
    var token: String?
    
    
    static func newInstance() -> Mappable {
        return KKSessionManager()
    }

    func mapping(map: Map) {
        
    }
    
    /*
     *------------------------------------------
     *MARK:- Sigletone Initilization
     *------------------------------------------
     */
    
    class var manager: KKSessionManager {
        return Static.intance
    }
    
    private struct Static {
        static let intance = Static.createIntance()
        
        static func createIntance() -> KKSessionManager{
            if let saveData = (try?NSString(contentsOfFile: KKSessionManager.savedFilePath(), encoding: NSUTF8StringEncoding)) as? String {
                if let storedSesstion = Mapper<KKSessionManager>().map(saveData) {
                    return storedSesstion
                }
            }
            let newInstance = KKSessionManager()
            return newInstance
            
        }
    }
    
    /*
     *--------------------------------------------------
     *MARK:- Saved To Plist
     *--------------------------------------------------
     */
    
    func save() {
        if let data = Mapper<KKSessionManager>().toJSONString(self, prettyPrint: false) {
            do{
                try data.writeToFile(KKSessionManager.savedFilePath(), atomically: true, encoding: NSUTF8StringEncoding)
            }catch _{
            }
        }
    }
    
    /*
     *------------------------------------------------------------
     *MARK:- privates Method
     *------------------------------------------------------------
    */
    
    class func savedFilePath() -> String {
        let folder: String = NSSearchPathForDirectoriesInDomains(.ApplicationSupportDirectory, .UserDomainMask, true).last!
        
        if !NSFileManager.defaultManager().fileExistsAtPath(folder) {
            do{
                try NSFileManager.defaultManager().createDirectoryAtPath(folder, withIntermediateDirectories: true, attributes: nil)
            }catch _{
            }
        }
        
        let className = NSStringFromClass(KKSessionManager).componentsSeparatedByString(".").last!
        
        return (folder as NSString).stringByAppendingPathComponent("\(className).plist")
        
    }
    
    
    
    //------------------------------------------------------
    //MARK:- GetMenuList
    //------------------------------------------------------
    
    func getMenuList() {
        
        var menuList = [MenuModel]()
        
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
        
        let manager = KKRequestManager.manager
        
        manager.request(.POST, AppConstant.Api.MenuList, parameters: nil).responseJSON { (responseObject) in
            print(responseObject)
            
//            let json = 
        }
        
        
    }
    
    
    

}

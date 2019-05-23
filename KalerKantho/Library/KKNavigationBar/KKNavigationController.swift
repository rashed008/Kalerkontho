//
//  KKNavigationController.swift
//  KalerKantho
//
//  Created by MAC on 8/17/16.
//  Copyright © 2016 AAPBD. All rights reserved.
//

import UIKit

class KKNavigationController: UINavigationController {

    var customView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let customView = CustomNavView(frame: CGRectMake(55, 20, 154, 46))
        customView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(customView)
        
        let iconImageView = UIImageView(frame: CGRectMake(0, 0, 154, 26))
        iconImageView.image = UIImage(named: "default-nav-icon")
        customView.addSubview(iconImageView)
        
        let dateLabel = UILabel(frame: CGRectMake(0,CGRectGetHeight(iconImageView.frame),154,18))
        dateLabel.textColor = UIColor.whiteColor()
        dateLabel.font = UIFont.systemFontOfSize(11)
        customView.addSubview(dateLabel)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

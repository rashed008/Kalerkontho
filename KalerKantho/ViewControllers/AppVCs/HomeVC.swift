//
//  HomeVC.swift
//  KalerKantho
//
//  Created by MAC on 8/17/16.
//  Copyright © 2016 AAPBD. All rights reserved.
//

import UIKit

class HomeVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSlideMenuButton()
        
    }

    @IBAction func optionsBarButtonPressed(sender: AnyObject) {
        print("OptionBarbuttonPressed")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}




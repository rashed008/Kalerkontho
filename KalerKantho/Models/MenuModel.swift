//
//  MenuModel.swift
//  KalerKantho
//
//  Created by MAC on 8/18/16.
//  Copyright © 2016 AAPBD. All rights reserved.
//

import UIKit

class MenuModel: NSObject {
    var id: String?
    var name: String?
    var m_type: String?
    var isExpanded: Bool = false
    var expandableList = [MenuModel]()
}

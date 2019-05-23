//
//  KKRequestManager.swift
//  KalerKantho
//
//  Created by MAC on 8/17/16.
//  Copyright © 2016 AAPBD. All rights reserved.
//

import UIKit
import Alamofire

class KKRequestManager: Manager {
    var baseUrl = NSURL(string: "http://www.kalerkantho.com/appapi/")
    
    static let manager: KKRequestManager = {
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.HTTPAdditionalHeaders = KKRequestManager.defaultHTTPHeaders
        return KKRequestManager(configuration: configuration)
    }()
    
  
    override func request(
        method: Alamofire.Method,
        _ URLString: URLStringConvertible,
          parameters: [String: AnyObject]? = nil,
          encoding: ParameterEncoding = .URL,
          headers: [String: String]? = nil) -> Request {
        
        let fullUrl = NSURL(string: URLString.URLString, relativeToURL: baseUrl)
        print("FullUrl \(fullUrl)")
        return super.request(method, fullUrl!, parameters: parameters, encoding: encoding, headers: headers)
    }
    
}

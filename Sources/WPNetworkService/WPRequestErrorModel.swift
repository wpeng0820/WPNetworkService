//
//  WPRequestErrorModel.swift
//  eShop
//
//  Created by 彭俊瑋 on 2018/4/28.
//  Copyright © 2018 selfEmployee. All rights reserved.
//

import Foundation

public class WPRequestErrorModel: NSObject {
    
    var errorMessage: String
    var errorCode: Int
    
    init(errorMessage: String, errorCode: Int) {
        self.errorMessage = errorMessage
        self.errorCode = errorCode
    }
}

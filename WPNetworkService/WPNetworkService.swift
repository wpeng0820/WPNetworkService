//
//  WPNetworkService.swift
//  WPNetworkService
//
//  Created by 彭俊瑋 on 2019/4/15.
//  Copyright © 2019 iOS9487. All rights reserved.
//

import Foundation

public class WPNetworkService {
    
    private var urlSession: URLSession!
    
    public static let shareInstance: WPNetworkService = {
        return WPNetworkService()
    }()
    
    init() {
        self.urlSession = URLSession(configuration: URLSessionConfiguration.ephemeral)
    }
    
    public func sendRequest(request: URLRequest, completion: @escaping(Data?, WPRequestErrorModel?) -> Void) {
        
        let urlSessionDataTask = URLSession.shared.dataTask(with: request, completionHandler: { (responseData, urlRsponse, error) in
            
            if let failure = error {
                let errorModel = WPRequestErrorModel(errorMessage: failure.localizedDescription, errorCode: 999)
                completion(nil, errorModel)
                return
            }
            
            guard let _ = urlRsponse else {
                let errorModel = WPRequestErrorModel(errorMessage: "URL Response is nil", errorCode: 998)
                completion(nil, errorModel)
                return
            }
            
            guard (urlRsponse! as! HTTPURLResponse).statusCode == 200 else {
                let errorModel = WPRequestErrorModel(errorMessage: "Http Status code is not 200", errorCode: 997)
                completion(nil, errorModel)
                return
            }
            
            completion(responseData, nil)
        })
        urlSessionDataTask.resume()
    }
}

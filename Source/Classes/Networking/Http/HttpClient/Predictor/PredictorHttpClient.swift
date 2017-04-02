//
//  PredictorHttpClient.swift
//  SwiftyPredictor
//
//  Created by Igor Matyushkin on 02.04.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import UIKit

internal class PredictorHttpClient {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    public init() {
        // Initialize internal HTTP client
        
        _internalHttpClient = SimpleHttpClient()
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    fileprivate var _internalHttpClient: SimpleHttpClient!
    
    fileprivate var internalHttpClient: SimpleHttpClient {
        get {
            return _internalHttpClient
        }
    }
    
    // MARK: Public object methods
    
    public func getJson(fromUrl url: String, withCompletion completion: ((_ jsonResponse: Any?, _ error: PredictorError?) -> Void)?) -> URLSessionDataTask {
        // Start request
        
        let task = internalHttpClient.getJson(fromUrl: url) { (jsonResponse, code, error) in
            // Obtain predictor error
            
            let predictorError: PredictorError? = code == nil ? nil : PredictorError(rawValue: code!)
            
            // Call completion
            
            completion?(jsonResponse, predictorError)
        }
        
        // Return result
        
        return task
    }
    
    // MARK: Private object methods
    
    // MARK: Protocol methods
    
}

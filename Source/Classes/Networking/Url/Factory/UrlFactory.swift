//
//  UrlFactory.swift
//  SwiftyPredictor
//
//  Created by Igor Matyushkin on 02.04.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation

internal class UrlFactory {
    
    // MARK: Class variables & properties
    
    // MARK: Class methods
    
    // MARK: Initializers
    
    public init() {
        // Initialize base URL
        
        _baseUrl = ""
    }
    
    // MARK: Deinitializer
    
    deinit {
        // Remove references
        
        _baseUrl = nil
    }
    
    // MARK: Variables & properties
    
    fileprivate var _baseUrl: String!
    
    public var baseUrl: String {
        get {
            return _baseUrl
        }
        set {
            // Update private variable
            
            _baseUrl = newValue
        }
    }
    
    // MARK: Public methods
    
    public func absoluteUrl(fromRelativePath relativePath: String) -> String {
        let resultUrl = String(format: "%@/%@", baseUrl, relativePath)
        return resultUrl
    }
    
    // MARK: Private methods
    
    // MARK: Protocol methods
    
}

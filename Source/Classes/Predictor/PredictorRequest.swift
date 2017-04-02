//
//  PredictorRequest.swift
//  SwiftyPredictor
//
//  Created by Igor Matyushkin on 02.04.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation

public class PredictorRequest {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    internal init(task: URLSessionDataTask) {
        // Initialize task
        
        _task = task
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    fileprivate var _task: URLSessionDataTask!
    
    internal var task: URLSessionDataTask {
        get {
            return _task
        }
    }
    
    // MARK: Public object methods
    
    public func cancel() {
        task.cancel()
    }
    
    // MARK: Private object methods
    
    // MARK: Protocol methods
    
}

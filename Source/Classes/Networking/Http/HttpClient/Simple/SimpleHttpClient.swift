//
//  SimpleHttpClient.swift
//  SwiftyPredictor
//
//  Created by Igor Matyushkin on 02.04.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation

internal class SimpleHttpClient {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    // MARK: Public object methods
    
    public func getJson(fromUrl url: String, withCompletion completion: ((_ jsonResponse: Any?, _ code: Int?, _ error: Error?) -> Void)?) -> URLSessionDataTask {
        // Obtain URL request
        
        let url = URL(string: url)!
        let request = URLRequest(url: url)
        
        // Obtain task
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Obtain result code
            
            let resultCode = (response as? HTTPURLResponse)?.statusCode
            
            // Check whether error is nil
            
            guard error == nil else {
                completion?(nil, resultCode, error)
                return
            }
            
            // Check whether data is not nil
            
            guard data != nil else {
                completion?(nil, resultCode, nil)
                return
            }
            
            // Obtain JSON object
            
            var jsonObject: Any? = nil
            
            do {
                jsonObject = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            } catch {
            }
            
            // Call completion
            
            completion?(jsonObject, resultCode, nil)
        }
        
        // Start request
        
        task.resume()
        
        // Return result
        
        return task
    }
    
    // MARK: Private object methods
    
    // MARK: Protocol methods
    
}

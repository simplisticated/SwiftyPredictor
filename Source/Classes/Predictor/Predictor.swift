//
//  Predictor.swift
//  SwiftyPredictor
//
//  Created by Igor Matyushkin on 02.04.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation

public class Predictor {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    public init(APIKey: String) {
        // Initialize API key
        
        _apiKey = APIKey
        
        // Initialize API client
        
        _apiClient = ApiClient()
        apiClient.apiKey = APIKey
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    fileprivate var _apiKey: String!
    
    public var apiKey: String {
        get {
            return _apiKey
        }
    }
    
    fileprivate var _apiClient: ApiClient!
    
    fileprivate var apiClient: ApiClient {
        get {
            return _apiClient
        }
    }
    
    // MARK: Public object methods
    
    @discardableResult
    public func availableLanguages(withCompletion completion: @escaping AvailableLanguagesRequestCompletion) -> PredictorRequest {
        // Start HTTP request
        
        let task = apiClient.send(request: .getAvailableLanguages(completion: { (languages, error) in
            completion(languages, error)
        }))
        
        // Obtain predictor request
        
        let predictorRequest = PredictorRequest(task: task)
        
        // Return result
        
        return predictorRequest
    }
    
    @discardableResult
    public func requestSuggestions(forQuery query: String, inLanguage language: Language, withMaximumNumberOfSuggestions maximumNumberOfSuggestions: Int, andCompletion completion: @escaping SuggestionsRequestCompletion) -> PredictorRequest {
        // Start HTTP request
        
        let task = apiClient.send(request: .getSuggestions(language: language, query: query, limit: maximumNumberOfSuggestions, completion: { (suggestions, error) in
            completion(suggestions, error)
        }))
        
        // Obtain predictor request
        
        let predictorRequest = PredictorRequest(task: task)
        
        // Return result
        
        return predictorRequest
    }
    
    // MARK: Private object methods
    
    // MARK: Protocol methods
    
}

//
//  ApiClient.swift
//  SwiftyPredictor
//
//  Created by Igor Matyushkin on 02.04.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import UIKit

internal class ApiClient {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    public init() {
        // Initialize API key
        
        _apiKey = ""
        
        // Initialize HTTP client
        
        _httpClient = PredictorHttpClient()
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    private var _apiKey: String!
    
    public var apiKey: String {
        get {
            return _apiKey
        }
        set {
            // Update private variable
            
            _apiKey = newValue
        }
    }
    
    private var _httpClient: PredictorHttpClient!
    
    private var httpClient: PredictorHttpClient {
        get {
            return _httpClient
        }
    }
    
    // MARK: Public object methods
    
    @discardableResult
    public func send(request: ApiRequest) -> URLSessionDataTask {
        // Obtain URL factory
        
        let urlFactory = UrlFactory()
        urlFactory.baseUrl = Definitions.baseURL
        
        // Handle request
        
        switch request {
        
        case let .getAvailableLanguages(completion):
            // Obtain absolute URL string
            
            let relativeUrl: RelativeUrl = .languages(apiKey: apiKey)
            let relativeUrlString = relativeUrl.stringValue
            let absoluteUrlString = urlFactory.absoluteUrl(fromRelativePath: relativeUrlString)
            
            // Start request
            
            let task = httpClient.getJson(fromUrl: absoluteUrlString, withCompletion: { (jsonResponse, error) in
                // Obtain result languages
                
                var resultLanguages = [Language]()
                
                if let jsonObject = jsonResponse as? [String] {
                    for languageIdentifier in jsonObject {
                        let language = Language.from(identifier: languageIdentifier)
                        resultLanguages.append(language)
                    }
                }
                
                // Call completion
                
                completion(resultLanguages, error)
            })
            
            // Return result
            
            return task
        
        case let .getSuggestions(language, query, limit, completion):
            // Encode query
            
            let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? String(format: "%@", query)
            
            // Obtain absolute URL string
            
            let relativeUrl: RelativeUrl = .complete(apiKey: apiKey, languageIdentifier: language.identifier, query: encodedQuery, limit: limit)
            let relativeUrlString = relativeUrl.stringValue
            let absoluteUrlString = urlFactory.absoluteUrl(fromRelativePath: relativeUrlString)
            
            // Start request
            
            let task = httpClient.getJson(fromUrl: absoluteUrlString, withCompletion: { (jsonResponse, error) in
                // Obtain result suggestions
                
                var resultSuggestions = [Suggestion]()
                
                if let jsonObject = jsonResponse as? [String : Any] {
                    if let endOfWord = jsonObject[RequestKeyStorage.endOfWord] as? Bool,
                        let position = jsonObject[RequestKeyStorage.pos] as? Int,
                        let stringSuggestions = jsonObject[RequestKeyStorage.text] as? [String] {
                        for suggestionText in stringSuggestions {
                            let suggestion = Suggestion(endOfWord: endOfWord, position: position, text: suggestionText)
                            resultSuggestions.append(suggestion)
                        }
                    }
                }
                
                // Call completion
                
                completion(resultSuggestions, error)
            })
            
            // Return result
            
            return task
        
        }
    }
    
    // MARK: Private object methods
    
    // MARK: Protocol methods
    
}

//
//  RelativeUrlExtensionStringRepresentation.swift
//  SwiftyPredictor
//
//  Created by Igor Matyushkin on 02.04.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation

internal extension RelativeUrl {
    
    internal var stringValue: String {
        get {
            switch self {
            case let .languages(apiKey):
                return String(format: "getLangs?%@=%@", RequestKeyStorage.key, apiKey)
            case let .complete(apiKey, languageIdentifier, query, limit):
                return String(format: "complete?%@=%@&%@=%@&%@=%@&%@=%d", RequestKeyStorage.key, apiKey, RequestKeyStorage.lang, languageIdentifier, RequestKeyStorage.q, query, RequestKeyStorage.limit, limit ?? 1)
            }
        }
    }
    
}

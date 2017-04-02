//
//  ApiRequest.swift
//  SwiftyPredictor
//
//  Created by Igor Matyushkin on 02.04.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation

internal enum ApiRequest {
    case getAvailableLanguages(completion: AvailableLanguagesRequestCompletion)
    case getSuggestions(language: Language, query: String, limit: Int?, completion: SuggestionsRequestCompletion)
}

//
//  RelativeUrl.swift
//  SwiftyPredictor
//
//  Created by Igor Matyushkin on 02.04.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation

internal enum RelativeUrl {
    case languages(apiKey: String)
    case complete(apiKey: String, languageIdentifier: String, query: String, limit: Int?)
}

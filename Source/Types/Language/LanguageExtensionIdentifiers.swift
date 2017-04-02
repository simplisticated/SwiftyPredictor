//
//  LanguageExtensionCodes.swift
//  SwiftyPredictor
//
//  Created by Igor Matyushkin on 02.04.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation

public extension Language {
    
    public var identifier: String {
        get {
            switch self {
            case .russian:
                return "ru"
            case .english:
                return "en"
            case let .custom(identifier):
                return identifier
            }
        }
    }
    
}

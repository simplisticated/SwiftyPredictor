//
//  LanguageExtensionInitialization.swift
//  SwiftyPredictorDemo
//
//  Created by Igor Matyushkin on 02.04.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation

public extension Language {
    
    fileprivate static var identifiedLanguages: [Language] {
        get {
            return [
                .russian,
                .english
            ]
        }
    }
    
    public static func from(identifier: String) -> Language {
        for language in identifiedLanguages {
            if identifier == language.identifier {
                return language
            }
        }
        
        return .custom(identifier: identifier)
    }
    
}

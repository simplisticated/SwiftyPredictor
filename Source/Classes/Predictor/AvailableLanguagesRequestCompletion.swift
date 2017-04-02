//
//  AvailableLanguagesRequestCompletion.swift
//  SwiftyPredictor
//
//  Created by Igor Matyushkin on 02.04.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation

public typealias AvailableLanguagesRequestCompletion = (_ languages: [Language], _ error: PredictorError?) -> Void

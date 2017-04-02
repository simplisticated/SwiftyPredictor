//
//  PredictorError.swift
//  SwiftyPredictor
//
//  Created by Igor Matyushkin on 02.04.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import Foundation

public enum PredictorError: Int {
    case apiKeyInvalid = 401
    case apiKeyBlocked = 402
    case dailyRequestLimitExceeded = 403
    case dailyCharactersLimitExceeded = 404
    case textTooLong = 413
    case languageNotSupported = 501
}

//
//  MainViewController.swift
//  SwiftyPredictorDemo
//
//  Created by Igor Matyushkin on 02.04.17.
//  Copyright © 2017 Igor Matyushkin. All rights reserved.
//

import UIKit
import SwiftyPredictor

class MainViewController: UIViewController {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Outlets
    
    // MARK: Object variables & properties
    
    // MARK: Public object methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let predictor = Predictor(APIKey: "{INSERT_YOUR_API_KEY_HERE}")
        
        predictor.requestSuggestions(forQuery: "запрос ", inLanguage: .russian, withMaximumNumberOfSuggestions: 10) { (suggestions, error) in
            for suggestion in suggestions {
                print(suggestion.text)
            }
            
            if error != nil {
                print("Error: \(error!)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Private object methods
    
    // MARK: Actions
    
    // MARK: Protocol methods
    
}

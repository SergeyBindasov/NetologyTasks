//
//  Checker.swift
//  Navigation
//
//  Created by Sergey on 03.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

final class FeedChecker {
    
    
    let password: String = "123456"
    
    func wordChecked(word: String) -> Bool {
        if word == password {
            return true
        } else {
            return false
        }
    }
    
}

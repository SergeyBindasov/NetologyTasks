//
//  Checker.swift
//  Navigation
//
//  Created by Sergey on 03.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

final class FeedChecker {
    
    //var check: Bool?
    
    let password: String = "12345"
    
    func wordChecked(word: String) -> Bool {
        if word == password {
            return true
        } else {
            return false
        }
    }
    
//    init(check: Bool?) {
//        self.check = check
//    }
}

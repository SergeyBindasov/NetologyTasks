//
//  Help.swift
//  Navigation
//
//  Created by Sergey on 03.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviewWithAutoLayout(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
    func addSubviews(_ views: UIView...) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
    
    func toAutoLayuot() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}

extension UIColor {
    static func createColor(lightMode: UIColor, darkMode: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else { return lightMode }
        return UIColor { (traitCollection: UITraitCollection) -> UIColor in
            return traitCollection.userInterfaceStyle == .light ? lightMode : darkMode
            
        }
    }
}

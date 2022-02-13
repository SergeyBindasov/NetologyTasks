//
//  CustomButton.swift
//  Navigation
//
//  Created by Sergey on 09.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

final class CustomButton: UIButton {
    
    var onTap: (() -> Void)?
    
    init(onTap:  (() -> Void)?) {
        self.onTap = onTap
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    @objc private func tapped() {
        onTap?()
    }
}

//
//  CustomTextfield.swift
//  Navigation
//
//  Created by Sergey on 04.08.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

final class CustomTextfield: UITextField {
    
    var onType: ((String) -> Void)?
    
    init(placeholder: String, onType: ((String) -> Void)?) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        self.onType = onType
        addTarget(self, action: #selector(textTyped), for: .editingChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func textTyped() {
        guard let text = text  else { return }
        onType?(text)
    }
    
    
    
}

//
//  GenderTextField.swift
//  FieldTestTask
//
//  Created by Alexey Gaidykov on 05.12.2022.
//

import UIKit

class GenderTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        placeholder = "Введите данные"
        textAlignment = .right
        tintColor = .clear
        font = Resource.Fonts.avenirNextRegular(with: 18)
    }
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        !isFirstResponder
    }
}

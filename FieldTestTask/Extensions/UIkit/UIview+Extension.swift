//
//  UIview+Extension.swift
//  FieldTestTask
//
//  Created by Alexey Gaidykov on 01.12.2022.
//

import UIKit

extension UIView {
    func addView(_ view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}

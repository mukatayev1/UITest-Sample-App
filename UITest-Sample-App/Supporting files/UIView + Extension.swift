//
//  Constraints.swift
//  UITest-Sample-App
//
//  Created by Aidos Mukatayev on 2022/04/27.
//

import UIKit

extension UIView {
    func activateConstraints(_ constraints: [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
}

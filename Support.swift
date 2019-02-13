//
//  Support.swift
//  novoda-constraints
//
//  Created by Simon Rowlands on 13/02/2019.
//

import UIKit

internal extension UIView {
    func prepareForConstraints() {
        guard let _ = self.superview else {
            fatalError("view doesn't have a superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
    }
}

internal extension Array where Element == Edge {
    mutating func remove(_ edge: Edge) {
        if let foundIndex = index(of: edge) {
            remove(at: foundIndex)
        }
    }
}

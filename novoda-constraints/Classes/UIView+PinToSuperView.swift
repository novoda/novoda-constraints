import Foundation
import UIKit

public extension UIView {
    
    func pinToSuperview(_ edges: [Edge] = Edge.all, insetBy inset: CGFloat = 0, priority: UILayoutPriority = .required) {
        for edge in edges {
            pinToSuperview(edge: edge, insetBy: inset, priority: priority)
        }
    }
    
    func pinToSuperview(_ edges: Edge..., insetBy inset: CGFloat = 0, priority: UILayoutPriority = .required) {
        for edge in edges {
            pinToSuperview(edge: edge, insetBy: inset, priority: priority)
        }
    }
    
    @discardableResult private func pinToSuperview(edge: Edge,
                                                   insetBy inset: CGFloat = 0,
                                                   priority: UILayoutPriority = .required,
                                                   relatedBy relation: NSLayoutRelation = .equal) -> NSLayoutConstraint {
        
        guard let superview = self.superview else {
            preconditionFailure("view has no superview")
        }
        
        return pin(edge, to: edge, of: superview, constant: inset, priority: priority, relatedBy: relation)
    }
}

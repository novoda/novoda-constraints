import Foundation
import UIKit

public extension UIView {
    
    func pinToSuperview(edges: [Edge] = Edge.all, inset: CGFloat = 0, priority: UILayoutPriority = .required) {
        for edge in edges {
            pinToSuperview(edge, inset: inset, priority: priority)
        }
    }
    
    func pinToSuperview(edges: Edge..., inset: CGFloat = 0, priority: UILayoutPriority = .required) {
        for edge in edges {
            pinToSuperview(edge, inset: inset, priority: priority)
        }
    }
    
    @discardableResult func pinToSuperview(_ edge: Edge,
                                                   inset: CGFloat = 0,
                                                   priority: UILayoutPriority = .required,
                                                   relatedBy relation: NSLayoutRelation = .equal) -> NSLayoutConstraint {
        
        guard let superview = self.superview else {
            preconditionFailure("view has no superview")
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: edge.layoutAttribute,
                                            relatedBy: relation,
                                            toItem: superview,
                                            attribute: edge.layoutAttribute,
                                            multiplier: 1,
                                            constant: edge.offset(equivalentToInset: inset))
        constraint.priority = priority
        superview.addConstraint(constraint)
        return constraint
    }
}

import Foundation
import UIKit

public extension UIView {
    
    func pinToSuperview(edges: [Edge] = Edge.all, constant: CGFloat = 0, priority: UILayoutPriority = .required) {
        for edge in edges {
            pinToSuperview(edge, constant: constant, priority: priority)
        }
    }
    
    func pinToSuperview(edges: Edge..., constant: CGFloat = 0, priority: UILayoutPriority = .required) {
        for edge in edges {
            pinToSuperview(edge, constant: constant, priority: priority)
        }
    }
    
    @discardableResult func pinToSuperview(_ edge: Edge,
                                                   constant: CGFloat = 0,
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
                                            constant: constant)
        constraint.priority = priority
        superview.addConstraint(constraint)
        return constraint
    }
}

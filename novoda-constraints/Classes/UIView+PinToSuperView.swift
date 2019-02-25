import Foundation
import UIKit

public extension UIView {
    
    func pin(toSuperview edges: [Edge],
        insetBy inset: CGFloat = 0,
        priority: UILayoutPriority = .required,
        relatedBy relation: NSLayoutRelation = .equal) {
        
        for edge in edges {
            pin(toSuperview: edge,
                insetBy: inset,
                priority: priority,
                relatedBy: relation)
        }
    }
    
    func pin(toSuperview edges: Edge...,
                        insetBy inset: CGFloat = 0,
                        priority: UILayoutPriority = .required,
                        relatedBy relation: NSLayoutRelation = .equal) {
        
        var edges = edges
        
        if edges.isEmpty {
            edges = Edge.all
        }
        
        for edge in edges {
            pin(toSuperview: edge,
                insetBy: inset,
                priority: priority,
                relatedBy: relation)
        }
    }
    
    @discardableResult private func pin(toSuperview edge: Edge,
                                                   insetBy inset: CGFloat = 0,
                                                   priority: UILayoutPriority = .required,
                                                   relatedBy relation: NSLayoutRelation = .equal) -> NSLayoutConstraint {
        
        guard let superview = self.superview else {
            preconditionFailure("view has no superview")
        }
        
        return pin(edge,
                   to: edge,
                   of: superview,
                   constant: inset,
                   priority: priority,
                   relatedBy: relation)
    }
}

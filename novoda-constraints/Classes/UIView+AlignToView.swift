import UIKit

public extension UIView {
    func align(_ edges: Edge...,
               with view: UIView,
               constant: CGFloat = 0,
               priority: UILayoutPriority = .required,
               relatedBy relation: NSLayoutConstraint.Relation = .equal) {
        
        align(edges,
              with: view,
              constant: constant,
              priority: priority,
              relatedBy: relation)
    }
    
    func align(_ edges: [Edge],
               with view: UIView,
               constant: CGFloat = 0,
               priority: UILayoutPriority = .required,
               relatedBy relation: NSLayoutConstraint.Relation = .equal) {
        
        for edge in edges {
            pin(edge,
                to: edge,
                of: view,
                constant: constant,
                priority: priority,
                relatedBy: relation)
        }
    }
}

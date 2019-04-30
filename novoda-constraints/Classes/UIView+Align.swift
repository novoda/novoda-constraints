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

public extension Sequence where Element == UIView {
    
    func align(edges: Edge...,
               constant: CGFloat = 0,
               priority: UILayoutPriority = .required,
               relatedBy relation: NSLayoutConstraint.Relation = .equal) {
        
        align(edges: edges,
              constant: constant,
              priority: priority,
              relatedBy: relation)
    }
    
    func align(edges: [Edge],
               constant: CGFloat = 0,
               priority: UILayoutPriority = .required,
               relatedBy relation: NSLayoutConstraint.Relation = .equal) {
        
        iterate { view, lastView, _ in
            view.align(edges,
                       with: lastView,
                       constant: constant,
                       priority: priority,
                       relatedBy: relation)
        }
    }
}

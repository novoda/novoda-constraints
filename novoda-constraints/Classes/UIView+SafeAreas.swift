import UIKit

@available(iOS 9.0, *)
public extension UIView {
    
    func pin(toSuperviewSafeArea edges: [Edge],
             insetBy inset: CGFloat = 0) {
        
        for edge in edges {
            pin(toSuperviewSafeArea: edge,
                insetBy: inset)
        }
    }
    
    func pin(toSuperviewSafeArea edges: Edge...,
             insetBy inset: CGFloat = 0) {
        
        var edges = edges
        
        if edges.isEmpty {
            edges = Edge.all
        }
        
        for edge in edges {
            pin(toSuperviewSafeArea: edge,
                insetBy: inset)
        }
    }
    
    @discardableResult func pin(toSuperviewSafeArea edge: Edge,
                                insetBy inset: CGFloat = 0) -> NSLayoutConstraint {
        
        guard let superview = self.superview else {
            preconditionFailure("view has no superview")
        }
        
        var anchor: NSLayoutConstraint
        
        switch edge {
        case .leading:
            anchor = leadingAnchor.constraint(equalTo: superview.leadingSafeAnchor,
                                              constant: Edge.leading.offset(equivalentToInset: inset))
        case .trailing:
            anchor = trailingAnchor.constraint(equalTo: superview.trailingSafeAnchor,
                                               constant: Edge.trailing.offset(equivalentToInset: inset))
        case .top:
            anchor = topAnchor.constraint(equalTo: superview.topSafeAnchor,
                                          constant: Edge.top.offset(equivalentToInset: inset))
        case .bottom:
            anchor = bottomAnchor.constraint(equalTo: superview.bottomSafeAnchor,
                                             constant: Edge.bottom.offset(equivalentToInset: inset))
        default:
            preconditionFailure("Unknown Edge type when pinning to superview safe area")
        }
        
        anchor.isActive = true
        return anchor
    }
}

import UIKit

@available(iOS 9.0, *)
public extension UIView {
    
    func pin(toSuperviewSafeArea edges: [Anchor],
             insetBy inset: CGFloat = 0) {
        
        for edge in edges {
            pin(toSuperviewSafeArea: edge,
                insetBy: inset)
        }
    }
    
    func pin(toSuperviewSafeArea edges: Anchor...,
             insetBy inset: CGFloat = 0) {
        
        var edges = edges
        
        if edges.isEmpty {
            edges = Anchor.all
        }
        
        for edge in edges {
            pin(toSuperviewSafeArea: edge,
                insetBy: inset)
        }
    }
    
    func pin(toSuperviewSafeArea anchor: Anchor,
             insetBy inset: CGFloat = 0) {
        
        prepareForConstraints()
        
        anchor.constrain(self, inset)
    }
}

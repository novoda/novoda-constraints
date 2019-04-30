import UIKit

public extension UIView {
    
    @discardableResult func set(height constant: CGFloat,
                                multiplier: CGFloat = 1,
                                priority: UILayoutPriority = .required,
                                relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        return pin(.height, constant: constant,
                   multiplier: multiplier,
                   priority: priority,
                   relatedBy: relation)
    }
    
    @discardableResult func set(width constant: CGFloat,
                                multiplier: CGFloat = 1,
                                priority: UILayoutPriority = .required,
                                relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        return pin(.width, constant: constant,
                   multiplier: multiplier,
                   priority: priority,
                   relatedBy: relation)
    }
    
    @discardableResult func set(widthEqualTo view: UIView,
                                attribute: NSLayoutConstraint.Attribute = .width,
                                constant: CGFloat = 0,
                                multiplier: CGFloat = 1,
                                priority: UILayoutPriority = .required,
                                relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        
        return pin(.width,
                   to: attribute,
                   of: view,
                   constant: constant,
                   multiplier: multiplier,
                   priority: priority,
                   relatedBy: relation)
    }
    
    @discardableResult func set(heightEqualTo view: UIView,
                                attribute: NSLayoutConstraint.Attribute = .height,
                                constant: CGFloat = 0,
                                multiplier: CGFloat = 1,
                                priority: UILayoutPriority = .required,
                                relatedBy relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        return pin(.height,
                   to: attribute,
                   of: view,
                   constant: constant,
                   multiplier: multiplier,
                   priority: priority,
                   relatedBy: relation)
    }
    
    func set(size: CGSize) {
        pin(.height, constant: size.height)
        pin(.width, constant: size.width)
    }
    
    func set(sizeEqualTo view: UIView,
             multiplier: CGFloat = 1,
             priority: UILayoutPriority = .required,
             relatedBy relation: NSLayoutConstraint.Relation = .equal) {
        
        set(widthEqualTo: view,
            multiplier: multiplier,
            priority: priority,
            relatedBy: relation)
        
        set(heightEqualTo: view,
            multiplier: multiplier,
            priority: priority,
            relatedBy: relation)
    }
}

public extension Sequence where Element == UIView {
    func size(height constant: CGFloat,
              multiplier: CGFloat = 1,
              priority: UILayoutPriority = .required,
              relatedBy relation: NSLayoutConstraint.Relation = .equal) {
        size(attribute: .height,
             constant: constant,
             multiplier: multiplier,
             priority: priority,
             relatedBy: relation)
    }
    func size(width constant: CGFloat,
              multiplier: CGFloat = 1,
              priority: UILayoutPriority = .required,
              relatedBy relation: NSLayoutConstraint.Relation = .equal) {
        size(attribute: .width,
             constant: constant,
             multiplier: multiplier,
             priority: priority,
             relatedBy: relation)
    }
    private func size(attribute: NSLayoutConstraint.Attribute,
                      constant: CGFloat = 0,
                      multiplier: CGFloat = 1,
                      priority: UILayoutPriority = .required,
                      relatedBy relation: NSLayoutConstraint.Relation = .equal) {

        forEach { view in
            view.pin(attribute,
                     constant: constant,
                     multiplier: multiplier,
                     priority: priority,
                     relatedBy: relation)
        }
    }
}

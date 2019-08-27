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

    /**
     Sets the aspect ratio of this view, setting the width to the size of the height multiplied by the ratio specified. If you set this value to 2, the width will be twice as large as the height. This is also useful for setting square views by passing an aspect ratio of 1.

     - Parameter aspectRatio: The multiplier to be used in the width - height constraint
     */

    func set(aspectRatio: CGFloat) {
        pin(.width, to: .height, of: self, constant: 0, multiplier: aspectRatio, priority: .required, relatedBy: .equal)
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

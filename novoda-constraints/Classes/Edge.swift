import UIKit

public struct Edge: Equatable {

    public let layoutAttribute: NSLayoutAttribute
    let insetMultiplier: CGFloat
    
    public static let top = Edge(layoutAttribute: .top, insetMultiplier: 1)

    public static let bottom = Edge(layoutAttribute: .bottom, insetMultiplier: -1)

    public static let leading = Edge(layoutAttribute: .leading, insetMultiplier: 1)

    public static let trailing = Edge(layoutAttribute: .trailing, insetMultiplier: -1)
    
    public static let all: [Edge] = [.top, .bottom, .leading, .trailing]
    
    func offset(equivalentToInset inset: CGFloat) -> CGFloat {
        return inset * insetMultiplier
    }
}

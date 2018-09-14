import UIKit

public struct Edge: Equatable {

    public let layoutAttribute: NSLayoutAttribute
    let insetMultiplier: CGFloat

    public static var top: Edge {
        return Edge(layoutAttribute: .top, insetMultiplier: 1)
    }

    public static var bottom: Edge {
        return Edge(layoutAttribute: .bottom, insetMultiplier: -1)
    }

    public static var leading: Edge {
        return Edge(layoutAttribute: .leading, insetMultiplier: 1)
    }

    public static var trailing: Edge {
        return Edge(layoutAttribute: .trailing, insetMultiplier: -1)
    }

    func offset(equivalentToInset inset: CGFloat) -> CGFloat {
        return inset * insetMultiplier
    }
}

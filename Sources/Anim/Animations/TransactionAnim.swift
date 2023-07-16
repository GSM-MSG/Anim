import Foundation
import UIKit

public struct TransactionAnim: Anim {
    private let animationFactory: () -> CAAnimation

    public init(animationFactory: @escaping () -> CAAnimation) {
        self.animationFactory = animationFactory
    }

    public func animate(view: UIView, completion: @escaping () -> Void) {
        CATransaction.begin()

        let caAnimation = animationFactory()
        CATransaction.setCompletionBlock(completion)

        view.layer.add(caAnimation, forKey: "")
        CATransaction.commit()
    }
}

public extension Anim where Self == TransactionAnim {
    static func transaction(animationFactory: @escaping () -> CAAnimation) -> TransactionAnim {
        TransactionAnim(animationFactory: animationFactory)
    }
}

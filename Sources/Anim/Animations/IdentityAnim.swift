import Foundation
import UIKit

public struct IdentityAnim: Anim {
    private let duration: TimeInterval

    public init(duration: TimeInterval = 0.5) {
        self.duration = duration
    }

    public func animate(view: UIView, completion: @escaping () -> Void) {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: self.duration, delay: 0) {
            view.transform = .identity
        } completion: { _ in
            completion()
        }
    }
}

public extension Anim where Self == IdentityAnim {
    static func identity(_ duration: TimeInterval = 0.5) -> IdentityAnim {
        IdentityAnim(duration: duration)
    }
}

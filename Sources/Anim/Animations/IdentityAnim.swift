import Foundation
import UIKit

public struct IdentityAnim: Anim {
    private let duration: TimeInterval
    private let options: UIView.AnimationOptions

    public init(duration: TimeInterval = 0.5, options: UIView.AnimationOptions = []) {
        self.duration = duration
        self.options = options
    }

    public func animate(view: UIView, completion: @escaping () -> Void) {
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: self.duration,
            delay: 0,
            options: self.options
        ) {
            view.transform = .identity
        } completion: { _ in
            completion()
        }
    }
}

public extension Anim where Self == IdentityAnim {
    static func identity(_ duration: TimeInterval = 0.5, options: UIView.AnimationOptions = []) -> IdentityAnim {
        IdentityAnim(duration: duration, options: options)
    }
}

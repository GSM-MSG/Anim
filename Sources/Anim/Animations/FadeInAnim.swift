import Foundation
import UIKit

public struct FadeInAnim: Anim {
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
            view.alpha = 1
        } completion: { _ in
            completion()
        }
    }
}

public extension Anim where Self == FadeInAnim {
    static func fadeIn(_ duration: TimeInterval = 0.5, options: UIView.AnimationOptions = []) -> FadeInAnim {
        FadeInAnim(duration: duration, options: options)
    }
}

import Foundation
import UIKit

public struct FadeOutAnim: Anim {
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
            view.alpha = 0
        } completion: { _ in
            completion()
        }
    }
}

public extension Anim where Self == FadeOutAnim {
    static func fadeOut(_ duration: TimeInterval = 0.5, options: UIView.AnimationOptions = []) -> FadeOutAnim {
        FadeOutAnim(duration: duration, options: options)
    }
}

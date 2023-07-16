import Foundation
import UIKit

public struct OpacityAnim: Anim {
    private let duration: TimeInterval
    private let opacity: CGFloat

    public init(duration: TimeInterval = 0.25, opacity: CGFloat) {
        self.duration = duration
        self.opacity = opacity
    }

    public func animate(view: UIView, completion: @escaping () -> Void) {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: self.duration, delay: 0) {
            view.alpha = opacity
        } completion: { _ in
            completion()
        }
    }
}

public extension Anim where Self == OpacityAnim {
    static func opacity(_ duration: TimeInterval = 0.5, opacity: CGFloat) -> OpacityAnim {
        OpacityAnim(duration: duration, opacity: opacity)
    }
}

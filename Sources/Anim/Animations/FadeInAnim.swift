import Foundation
import UIKit

public struct FadeInAnim: Anim {
    private let duration: TimeInterval

    public init(duration: TimeInterval = 0.25) {
        self.duration = duration
    }

    public func animate(view: UIView, completion: @escaping () -> Void) {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: self.duration, delay: 0) {
            view.alpha = 1
        } completion: { _ in
            completion()
        }
    }
}

public extension Anim where Self == FadeInAnim {
    static func fadeIn(_ duration: TimeInterval = 0.5) -> FadeInAnim {
        FadeInAnim(duration: duration)
    }
}

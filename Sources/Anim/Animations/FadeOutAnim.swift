import Foundation
import UIKit

public struct FadeOutAnim: Anim {
    private let duration: TimeInterval

    public init(duration: TimeInterval = 0.25) {
        self.duration = duration
    }

    public func animate(view: UIView, completion: @escaping () -> Void) {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: self.duration, delay: 0) {
            view.alpha = 0
        } completion: { _ in
            completion()
        }
    }
}

public extension Anim where Self == FadeOutAnim {
    static func fadeOut(_ duration: TimeInterval = 0.5) -> FadeOutAnim {
        FadeOutAnim(duration: duration)
    }
}

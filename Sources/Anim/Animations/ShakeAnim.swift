import Foundation
import UIKit

public struct ShakeAnim: Anim {
    private let duration: TimeInterval
    private let springX: CGFloat
    private let damping: CGFloat
    private let initialVelocity: CGVector

    public init(
        duration: TimeInterval = 0.4,
        springX: CGFloat = 20,
        damping: CGFloat = 0.2,
        velocity: CGVector = .init(dx: 1, dy: 1)
    ) {
        self.duration = duration
        self.springX = springX
        self.damping = damping
        self.initialVelocity = velocity
    }

    public func animate(view: UIView, completion: @escaping () -> Void) {
        let springTimingParameter = UISpringTimingParameters(
            dampingRatio: self.damping,
            initialVelocity: self.initialVelocity
        )
        let animator = UIViewPropertyAnimator(duration: self.duration, timingParameters: springTimingParameter)
        animator.addAnimations {
            view.transform = .identity
        }
        animator.addCompletion { _ in
            completion()
        }

        view.transform = .init(translationX: springX, y: 0)
        animator.startAnimation()
    }
}

public extension Anim where Self == ShakeAnim {
    static func shake(
        _ duration: TimeInterval = 0.45,
        springX: CGFloat = 20,
        damping: CGFloat = 0.2,
        velocity: CGVector = .init(dx: 1,dy: 1)
    ) -> ShakeAnim {
        ShakeAnim(duration: duration)
    }
}

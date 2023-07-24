import Foundation
import UIKit

public struct RotateAnim: Anim {
    private let duration: TimeInterval
    private let angle: CGFloat
    private let reversed: Bool
    private let options: UIView.AnimationOptions

    public init(
        duration: TimeInterval = 0.4,
        angle: CGFloat,
        options: UIView.AnimationOptions = [],
        reversed: Bool = false
    ) {
        self.duration = duration
        self.angle = angle
        self.options = options
        self.reversed = reversed
    }

    public func animate(view: UIView, completion: @escaping () -> Void) {
        let rotateAffineTransform = CGAffineTransform(rotationAngle: self.angle)

        let transformFrom = view.transform
        let transformTo = view.transform.concatenating(rotateAffineTransform)
        if !self.reversed {
            view.transform = transformTo
        }

        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: self.duration,
            delay: 0,
            options: self.options
        ) {
            view.transform = self.reversed ? transformTo : transformFrom
        } completion: { _ in
            completion()
        }
    }
}

public extension Anim where Self == RotateAnim {
    static func rotate(
        _ duration: TimeInterval = 0.5,
        angle: CGFloat,
        options: UIView.AnimationOptions = [],
        reversed: Bool = false
    ) -> RotateAnim {
        RotateAnim(duration: duration, angle: angle, options: options, reversed: reversed)
    }
}

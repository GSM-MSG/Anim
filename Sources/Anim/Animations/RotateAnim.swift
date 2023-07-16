import Foundation
import UIKit

public struct RotateAnim: Anim {
    private let duration: TimeInterval
    private let angle: CGFloat
    private let reversed: Bool

    public init(duration: TimeInterval = 0.4, angle: CGFloat, reversed: Bool = false) {
        self.duration = duration
        self.angle = angle
        self.reversed = reversed
    }

    public func animate(view: UIView, completion: @escaping () -> Void) {
        let rotateAffineTransform = CGAffineTransform(rotationAngle: self.angle)

        let transformFrom = view.transform
        let transformTo = view.transform.concatenating(rotateAffineTransform)
        if !reversed {
            view.transform = transformTo
        }

        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: self.duration, delay: 0) {
            view.transform = reversed ? transformTo : transformFrom
        } completion: { _ in
            completion()
        }
    }
}

public extension Anim where Self == RotateAnim {
    static func rotate(
        _ duration: TimeInterval = 0.5,
        angle: CGFloat,
        reversed: Bool = false
    ) -> RotateAnim {
        RotateAnim(duration: duration, angle: angle, reversed: reversed)
    }
}

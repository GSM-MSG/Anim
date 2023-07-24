import Foundation
import UIKit

public struct ScaleAnim: Anim {
    private let duration: TimeInterval
    private let scale: CGFloat
    private let reversed: Bool
    private let options: UIView.AnimationOptions

    public init(
        duration: TimeInterval = 0.5,
        scale: CGFloat = 1.2,
        options: UIView.AnimationOptions = [],
        reversed: Bool = false
    ) {
        self.duration = duration
        self.scale = scale
        self.options = options
        self.reversed = reversed
    }

    public func animate(view: UIView, completion: @escaping () -> Void) {
        let scaleAffineTransform = CGAffineTransform(scaleX: self.scale, y: self.scale)

        let transformFrom = view.transform
        let transformTo = view.transform.concatenating(scaleAffineTransform)
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

public extension Anim where Self == ScaleAnim {
    static func scale(
        _ duration: TimeInterval = 0.5,
        scale: CGFloat = 1.2,
        options: UIView.AnimationOptions = [],
        reversed: Bool = false
    ) -> ScaleAnim {
        ScaleAnim(duration: duration, scale: scale, options: options, reversed: reversed)
    }
}

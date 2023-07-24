import Foundation
import UIKit

public struct FlashAnim: Anim {
    private let duration: TimeInterval
    private let options: UIView.AnimationOptions

    public init(duration: TimeInterval = 0.5, options: UIView.AnimationOptions = []) {
        self.duration = duration
        self.options = options
    }

    public func animate(view: UIView, completion: @escaping () -> Void) {
        let serialAnim = SerialAnim(animations: [
            .fadeOut(self.duration, options: self.options),
            .fadeIn(self.duration, options: self.options)
        ])
        view.anim(anim: serialAnim, completion: completion)
    }
}

public extension Anim where Self == FlashAnim {
    static func flash(_ duration: TimeInterval = 0.5, options: UIView.AnimationOptions = []) -> FlashAnim {
        FlashAnim(duration: duration, options: options)
    }
}

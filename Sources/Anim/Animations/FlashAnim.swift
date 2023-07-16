import Foundation
import UIKit

public struct FlashAnim: Anim {
    private let duration: TimeInterval

    public init(duration: TimeInterval = 0.25) {
        self.duration = duration
    }

    public func animate(view: UIView, completion: @escaping () -> Void) {
        let serialAnim = SerialAnim(animations: [
            .fadeOut(self.duration),
            .fadeIn(self.duration)
        ])
        view.anim(anim: serialAnim, completion: completion)
    }
}

public extension Anim where Self == FlashAnim {
    static func flash(_ duration: TimeInterval = 0.5) -> FlashAnim {
        FlashAnim(duration: duration)
    }
}

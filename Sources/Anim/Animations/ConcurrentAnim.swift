import Foundation
import UIKit

public struct ConcurrentAnim: Anim {
    private let animations: [any Anim]

    public init(animations: [any Anim]) {
        self.animations = animations
    }

    public func animate(view: UIView, completion: @escaping () -> Void) {
        guard !self.animations.isEmpty else {
            completion()
            return
        }

        var animations = self.animations
        let firstAnimation = animations.removeFirst()
        firstAnimation.animate(view: view, completion: completion)

        animations.forEach { anim in
            anim.animate(view: view) {}
        }
    }
}

public extension Anim where Self == ConcurrentAnim {
    static func concurrent(_ animations: [any Anim]) -> ConcurrentAnim {
        ConcurrentAnim(animations: animations)
    }
}

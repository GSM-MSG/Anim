import Foundation
import UIKit

public struct SerialAnim: Anim {
    private let animations: [any Anim]

    public init(animations: [any Anim]) {
        self.animations = animations
    }

    public func animate(view: UIView, completion: @escaping () -> Void) {
        recursiveAnimation(view: view, animation: animations, completion: completion)
    }
}

private extension SerialAnim {
    func recursiveAnimation(view: UIView, animation: [any Anim], completion: @escaping () -> Void) {
        guard let firstAnimation = animation.first else {
            completion()
            return
        }

        var remainAnimations = animation
        remainAnimations.removeFirst()

        firstAnimation.animate(view: view) {
            recursiveAnimation(view: view, animation: remainAnimations, completion: completion)
        }
    }
}

public extension Anim where Self == SerialAnim {
    static func serial(_ animations: [any Anim]) -> SerialAnim {
        SerialAnim(animations: animations)
    }
}

import Foundation
import UIKit

public struct SleepAnim: Anim {
    private let duration: TimeInterval

    public init(duration: TimeInterval = 0.5) {
        self.duration = duration
    }

    public func animate(view: UIView, completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: completion)
    }
}

public extension Anim where Self == SleepAnim {
    static func sleep(_ duration: TimeInterval = 0.5) -> SleepAnim {
        SleepAnim(duration: duration)
    }
}

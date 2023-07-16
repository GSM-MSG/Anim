import Foundation
import UIKit

public struct MoveFromAnim: Anim {
    public enum Direction {
        case top
        case left
        case bottom
        case right
    }

    private let duration: TimeInterval
    private let direction: Direction
    private let offset: CGFloat
    private let reversed: Bool

    public init(
        duration: TimeInterval = 0.5,
        direction: Direction,
        offset: CGFloat = 50,
        reversed: Bool = false
    ) {
        self.duration = duration
        self.direction = direction
        self.offset = offset
        self.reversed = reversed
    }

    public func animate(view: UIView, completion: @escaping () -> Void) {
        let offsetValue = self.offset * self.direction.sign
        let moveFromAffineTransform: CGAffineTransform
        if self.direction.isVertical {
            moveFromAffineTransform = .init(translationX: 0, y: offsetValue)
        } else {
            moveFromAffineTransform = .init(translationX: offsetValue, y: 0)
        }

        let transformFrom = view.transform
        let transformTo = view.transform.concatenating(moveFromAffineTransform)
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

public extension MoveFromAnim.Direction {
    var isVertical: Bool {
        switch self {
        case .top, .bottom: return true
        case .left, .right: return false
        }
    }

    var sign: CGFloat {
        switch self {
        case .top, .left: return -1
        case .bottom, .right: return 1
        }
    }
}

public extension Anim where Self == MoveFromAnim {
    static func moveFrom(
        _ duration: TimeInterval = 0.5,
        direction: MoveFromAnim.Direction,
        offset: CGFloat,
        reversed: Bool = false
    ) -> MoveFromAnim {
        .init(duration: duration, direction: direction, offset: offset, reversed: reversed)
    }

    static func moveFromTop(
        _ duration: TimeInterval = 0.5,
        offset: CGFloat,
        reversed: Bool = false
    ) -> MoveFromAnim {
        .init(duration: duration, direction: .top, offset: offset, reversed: reversed)
    }

    static func moveFromLeft(
        _ duration: TimeInterval = 0.5,
        offset: CGFloat,
        reversed: Bool = false
    ) -> MoveFromAnim {
        .init(duration: duration, direction: .left, offset: offset, reversed: reversed)
    }

    static func moveFromBottom(
        _ duration: TimeInterval = 0.5,
        offset: CGFloat,
        reversed: Bool = false
    ) -> MoveFromAnim {
        .init(duration: duration, direction: .bottom, offset: offset, reversed: reversed)
    }

    static func moveFromRight(
        _ duration: TimeInterval = 0.5,
        offset: CGFloat,
        reversed: Bool = false
    ) -> MoveFromAnim {
        .init(duration: duration, direction: .right, offset: offset, reversed: reversed)
    }
}

import UIKit

public protocol AnimAppliable {
    func anim(anim: any Anim, completion: @escaping () -> Void)
}

extension AnimAppliable {
    public func anim(anim: any Anim, completion: @escaping () -> Void = {}) {
        self.anim(anim: anim, completion: completion)
    }
}

extension AnimAppliable where Self: UIView {
    public func anim(anim: any Anim, completion: @escaping () -> Void = {}) {
        anim.animate(view: self, completion: completion)
    }
}

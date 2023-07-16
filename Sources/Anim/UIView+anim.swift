import UIKit

extension UIView: AnimAppliable {}

extension [UIView]: AnimAppliable {
    public func anim(anim: any Anim, completion: @escaping () -> Void) {
        recursiveViewAnim(views: self, anim: anim, completion: completion)

        func recursiveViewAnim(views: [UIView], anim: any Anim, completion: @escaping () -> Void) {
            guard let firstView = views.first else {
                completion()
                return
            }

            var remainViews = views
            remainViews.removeFirst()

            firstView.anim(anim: anim) {
                recursiveViewAnim(views: remainViews, anim: anim, completion: completion)
            }
        }
    }
}

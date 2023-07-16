import Foundation
import UIKit

public protocol Anim {
    func animate(view: UIView, completion: @escaping () -> Void)
}

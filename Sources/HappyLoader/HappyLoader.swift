import UIKit
import HappyColors

private class LoadingView: UIView {
    static let shared = LoadingView()
    let indicator = UIActivityIndicatorView(style: .whiteLarge)
    let label = UILabel()
    var isLoading: Bool { return indicator.isAnimating }
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.flatBlack.withAlphaComponent(0.35)
        layer.isOpaque = false
        indicator.hidesWhenStopped = true
        indicator.color = .flatWhite
        addSubview(indicator)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        frame = self.superview?.bounds ?? UIScreen.main.bounds
        layer.cornerRadius = superview?.layer.cornerRadius ?? 0
        indicator.center = CGPoint(x: frame.width / 2.0, y: frame.height / 2.0)
    }
    
    func showLoading(on view: UIView) {
        view.addSubview(self)
        indicator.startAnimating()
    }
    
    func removeLoading() {
        indicator.stopAnimating()
        self.removeFromSuperview()
        frame = .zero
    }
}


public extension UIView {
    func showLoading(text: String? = nil) {
        LoadingView.shared.showLoading(on: self)
    }
    
    func stopLoading() {
        LoadingView.shared.removeLoading()
    }
}

public extension UIViewController {
    func showLoading(text: String? = nil) {
        view.showLoading()
    }
    
    func stopLoading() {
        view.stopLoading()
    }
}

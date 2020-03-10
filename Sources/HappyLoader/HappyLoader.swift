#if !os(macOS)
import UIKit

private class LoadingView: UIView {
    static let shared = LoadingView()
    let indicator = UIActivityIndicatorView(style: .large)
    let label = UILabel()
    var isLoading: Bool { return indicator.isAnimating }
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(white: 0.35, alpha: 0.5)
        layer.isOpaque = false
        indicator.hidesWhenStopped = true
        indicator.color = .white
        addSubview(indicator)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        frame = self.superview?.bounds ?? UIScreen.main.bounds
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


extension UIView {
    func showLoading(text: String? = nil) {
        LoadingView.shared.showLoading(on: self)
    }
    
    func stopLoading() {
        LoadingView.shared.removeLoading()
    }
}

extension UIViewController {
    func showLoading(text: String? = nil) {
        view.showLoading()
    }
    
    func stopLoading() {
        view.stopLoading()
    }
}
#endif

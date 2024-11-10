//
//  PresentationController.swift
//  SQKeyboard
//
//  Created by luxingkai on 2024/11/9.
//

import UIKit

class PresentationController: UIPresentationController {
    
    var _presentedViewController: UIViewController?
    var _presentingViewController: UIViewController?
    var _maskView: UIView = UIView()
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        _presentedViewController = presentedViewController
        _presentingViewController = presentingViewController
        
        let contentInset = 30.0
        let contenHeight = 200.0
        let contentWidth = UIScreen.main.bounds.width - contentInset * 2
        let origin_y = (UIScreen.main.bounds.height - 200) / 2.0
        _presentedViewController?.view.frame = CGRectMake(30, origin_y, contentWidth, contenHeight)
        _presentedViewController?.view.layer.cornerRadius = 12
        
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
        
    override var presentedViewController: UIViewController {
        return _presentedViewController!
    }
    
    override var presentingViewController: UIViewController {
        return _presentingViewController!
    }
    
    override var presentationStyle: UIModalPresentationStyle {
        return .fullScreen
    }
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()

    }
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
    }
    
//    override var presentedView: UIView? {
//        return _presentedViewController?.view
//    }
    
    override var shouldRemovePresentersView: Bool {
        return false
    }
    
    override var shouldPresentInFullscreen: Bool {
        return true
    }
    
//    override var frameOfPresentedViewInContainerView: CGRect {
//        let contentInset = 30.0
//        let contenHeight = 200.0
//        let contentWidth = UIScreen.main.bounds.width - contentInset * 2
//        let origin_y = (UIScreen.main.bounds.height - 200) / 2.0
//        return CGRectMake(30, origin_y, contentWidth, contenHeight)
//    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        _maskView.frame = UIScreen.main.bounds
        _maskView.backgroundColor = UIColor(white: 0, alpha: 0.4)
        self.containerView?.addSubview(_maskView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        _maskView.addGestureRecognizer(tapGesture)
        
        let transitionCoordinator = _presentingViewController?.transitionCoordinator
        
        _maskView.alpha = 0.0;
        transitionCoordinator?.animate(alongsideTransition: { [self] context in
            _maskView.alpha = 1.0
        }, completion: nil)
        
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        super.presentationTransitionDidEnd(completed)
        if (!completed) {
            _maskView.removeFromSuperview()
        }
    }
    
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        _maskView.removeFromSuperview()
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        super.dismissalTransitionDidEnd(completed)
        if (!completed) {
            _maskView.frame = UIScreen.main.bounds
            _maskView.backgroundColor = UIColor.black
            _maskView.alpha = 0.4
            self.containerView?.addSubview(_maskView)
        }
    }
    
    @objc func tap(tapGesture: UITapGestureRecognizer) {
        _maskView.removeFromSuperview()
        let redControler:RedViewController = _presentedViewController as! RedViewController
        redControler.hideAlertViewController()
    }
    
}

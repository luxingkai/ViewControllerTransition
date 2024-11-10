//
//  RedViewController.swift
//  SQKeyboard
//
//  Created by luxingkai on 2024/11/3.
//

import UIKit

class RedViewController: UIViewController {
    
    var controller: UIViewController?
    var isPresenting: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.hideAlertViewController()
    }
    
    func showAlertViewController() {
        isPresenting = true
        self.modalTransitionStyle = .flipHorizontal
        self.transitioningDelegate = self
        self.modalPresentationStyle = .custom
        controller!.present(self, animated: true)
    }
    
    func hideAlertViewController() {
        isPresenting = false
        self.transitioningDelegate = self
        self.modalPresentationStyle = .custom
        self.dismiss(animated: true)
    }
    
}


extension RedViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> (any UIViewControllerAnimatedTransitioning)? {
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> (any UIViewControllerAnimatedTransitioning)? {
        return self
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = PresentationController(presentedViewController: presented, presenting: source)
        return presentationController
    }
}

let duration = 0.25
let alertViewWidth = 200.0
let alertViewHeight = 120.0

extension RedViewController: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: (any UIViewControllerContextTransitioning)?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: any UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        let fromViewController = transitionContext.viewController(forKey: .from)!
        let toViewController = transitionContext.viewController(forKey: .to)!
        
        //        let fromView = transitionContext.view(forKey: .from)!
        //        let toView = transitionContext.view(forKey: .to)!
        
//        let initFromFrame = transitionContext.initialFrame(for: fromViewController)
//        let initToFrame = transitionContext.initialFrame(for: toViewController)
//        
//        let finalFromFrame = transitionContext.finalFrame(for: fromViewController)
//        let finalToFrame = transitionContext.finalFrame(for: toViewController)
        
        if (isPresenting) {
            /// presenting  view controller
            if (!transitionContext.isAnimated) {
                /// no animation
                containerView.addSubview(toViewController.view!)
                transitionContext.completeTransition(true)
            } else {
                /// animation
                containerView.addSubview(toViewController.view!)
                transitionContext.completeTransition(true)
                
//                toViewController.view.frame = initToFrame
//                UIView.animate(withDuration: duration) {
//                    toViewController.view.frame = finalToFrame;
//                } completion: { completion in
//                    transitionContext.completeTransition(completion)
//                }
            }
        } else {
            /// dismiss view controller
            if (!transitionContext.isAnimated) {
                /// no animation
                fromViewController.view.removeFromSuperview()
                transitionContext.completeTransition(true)
            } else {
                /// animation
                fromViewController.view.removeFromSuperview()
                transitionContext.completeTransition(true)
            }
        }
        
    }
    
    func animationEnded(_ transitionCompleted: Bool) {
        
    }
    
}

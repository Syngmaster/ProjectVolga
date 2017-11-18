//
//  PopAnimator.swift
//  VolgaFashion
//
//  Created by Syngmaster on 18/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard
            let toVC = transitionContext.viewController(forKey: .to),
            let fromVC = transitionContext.viewController(forKey: .from)
            else { return }
        
        transitionContext.containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromVC.view.alpha = 1.0
            fromVC.view.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
        }, completion: { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })

    }
}



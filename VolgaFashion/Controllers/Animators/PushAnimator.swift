//
//  PushAnimator.swift
//  VolgaFashion
//
//  Created by Syngmaster on 18/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

class PushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let toVC = transitionContext.viewController(forKey: .to),
            let fromVC = transitionContext.viewController(forKey: .from) as? ItemsListViewController
            else { return }
        
        let selectedCell = fromVC.collectionView?.cellForItem(at: fromVC.selectedCell!) as! ItemViewCell
            
        if let snapshot = selectedCell.imageView.snapshotView(afterScreenUpdates: false) {
            
            snapshot.isUserInteractionEnabled = false
            snapshot.layer.opacity = 1.0
            snapshot.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
            snapshot.center = CGPoint(x: selectedCell.center.x, y: selectedCell.center.y)
            
            transitionContext.containerView.insertSubview(snapshot, aboveSubview: toVC.view)
            
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
                snapshot.transform = CGAffineTransform.init(scaleX: 2.2, y: 2.2)
                snapshot.center = CGPoint(x: toVC.view.center.x, y: toVC.view.center.y - 20)
            }, completion: { (finished) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                
                UIView.animate(withDuration: 0.1, animations: {
                    snapshot.alpha = 0.0
                    snapshot.transform = CGAffineTransform.init(scaleX: 2.0, y: 2.0)
                }, completion: { (finished) in
                    snapshot.removeFromSuperview()
                    transitionContext.containerView.insertSubview(toVC.view, aboveSubview: fromVC.view)
                    
                })
            })
        }
    }
}

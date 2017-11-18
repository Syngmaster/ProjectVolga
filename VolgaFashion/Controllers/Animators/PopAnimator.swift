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
        
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else {
            // Something really bad happend and it is not possible to perform the transition
            print("ERROR: Transition impossible to perform since either the destination view or the conteiner view are missing!")
            return
        }
        
        let container = transitionContext.containerView
        
        guard let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as? ItemsListViewController,
            let toCollectionView = toViewController.collectionView,
            let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let fromView = fromViewController.view,
            let selectedCell = toViewController.selectedCell else {
                // There are not enough info to perform the animation but it is still possible
                // to perform the transition presenting the destination view
                container.addSubview(toView)
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                return
        }
        
        // Add destination view to the container view
        container.addSubview(toView)
        
        // Prepare the screenshot of the source view for animation
        let screenshotFromView = fromView.snapshotView(afterScreenUpdates: false)!
        screenshotFromView.frame = fromView.frame
        
        // Prepare the screenshot of the destination view for animation
        let screenshotToView = selectedCell.snapshotView(afterScreenUpdates: false)!
        screenshotToView.frame = screenshotFromView.frame
        
        // Add screenshots to transition container to set-up the animation
        container.addSubview(screenshotToView)
        container.insertSubview(screenshotFromView, belowSubview: screenshotToView)
        
        // Set views initial states
        screenshotToView.alpha = 0.0
        fromView.isHidden = true
        selectedCell.isHidden = true
        
        let containerCoord = toCollectionView.convert(selectedCell.frame.origin, to: container)
        
        UIView.animate(withDuration:self.transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0, options: [], animations: { () -> Void in
            
            screenshotToView.alpha = 1.0
            screenshotFromView.frame = selectedCell.frame
            screenshotFromView.frame.origin = containerCoord
            screenshotToView.frame = screenshotFromView.frame
            
        }) { _ in
            
            selectedCell.isHidden = false
            screenshotFromView.removeFromSuperview()
            screenshotToView.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            
        }
    
    }
}



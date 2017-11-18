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
        return 0.7
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        guard let toView = transitionContext.view(forKey: .to)
            else { return }
        
        let container = transitionContext.containerView
        
        guard
            let fromVC = transitionContext.viewController(forKey: .from) as? ItemsListViewController,
            let fromView = fromVC.collectionView,
            let selectedCell = fromVC.selectedCell as? ItemViewCell
            else { return }
        
        container.addSubview(toView)
        let screenshotToView =  UIImageView(image: toView.screenshot)
        screenshotToView.frame = selectedCell.frame
        
        let containerCoord = fromView.convert(screenshotToView.frame.origin, to: container)
        screenshotToView.frame.origin = containerCoord
        
        let screenshotFromView = UIImageView(image: selectedCell.imageView.screenshot)
        screenshotFromView.frame = screenshotToView.frame
        
        container.addSubview(screenshotToView)
        container.addSubview(screenshotFromView)
        
        toView.isHidden = true
        screenshotToView.isHidden = false

        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: [], animations: { () -> Void in
            
            screenshotToView.frame = UIScreen.main.bounds
            screenshotToView.frame.origin = CGPoint(x: 0.0, y: 0.0)
            screenshotFromView.frame = screenshotToView.frame
            
            
        }) { _ in
            
            screenshotToView.removeFromSuperview()
            screenshotFromView.removeFromSuperview()
            toView.isHidden = false
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            
        }
    }
}

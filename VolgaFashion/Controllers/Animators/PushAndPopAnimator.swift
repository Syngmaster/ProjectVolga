//
//  PushAnimator.swift
//  VolgaFashion
//
//  Created by Syngmaster on 18/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

class PushAndPopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let _operationType : UINavigationControllerOperation
    let _transitionDuration : TimeInterval
    
    init(operation: UINavigationControllerOperation) {
        _operationType = operation
        _transitionDuration = 0.7
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.7
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if _operationType == .push {
            performPushTransition(transitionContext)
        } else if _operationType == .pop {
            performPopTransition(transitionContext)
        }
    }
    
    
    func performPushTransition(_ transitionContext:UIViewControllerContextTransitioning) {
        
        guard let toView = transitionContext.view(forKey: .to)
            else { return }
        
        let container = transitionContext.containerView
        
        guard
            let fromVC = transitionContext.viewController(forKey: .from) as? ItemsListViewController,
            let fromView = fromVC.collectionView,
            let selectedCell = fromVC.selectedCell as? ItemViewCell
            else { return }
        
        fromVC.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        fromVC.navigationController?.navigationBar.shadowImage = nil
        fromVC.navigationController?.navigationBar.isTranslucent = true
        
        container.addSubview(toView)
        let screenshotToView =  UIImageView(image: toView.screenshot)
        screenshotToView.frame = selectedCell.frame
        
        let containerCoord = fromView.convert(screenshotToView.frame.origin, to: container)
        screenshotToView.frame.origin = containerCoord
        
        let screenshotFromView = UIImageView(image: selectedCell.imageView.screenshot)
        screenshotFromView.frame = screenshotToView.frame
        
        print(selectedCell.frame)
        print(screenshotFromView.frame)
        
        container.addSubview(screenshotToView)
        container.addSubview(screenshotFromView)
        
        toView.isHidden = true
        screenshotToView.isHidden = false
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: [], animations: { () -> Void in
            
            screenshotFromView.alpha = 0.0
            screenshotToView.frame = UIScreen.main.bounds
            screenshotToView.frame.origin = CGPoint(x: 0.0, y: 0.0)
            screenshotFromView.frame = CGRect(x: screenshotToView.frame.minX, y: screenshotToView.frame.minY, width: screenshotToView.frame.width, height: screenshotToView.frame.height - 170)
            fromVC.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            fromVC.navigationController?.navigationBar.shadowImage = UIImage()
            fromVC.navigationController?.navigationBar.isTranslucent = true
            
        }) { _ in
            

            
            screenshotToView.removeFromSuperview()
            screenshotFromView.removeFromSuperview()
            toView.isHidden = false
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            
        }
    }
    
    func performPopTransition(_ transitionContext:UIViewControllerContextTransitioning) {
        
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
        let screenshotFromView = UIImageView(image:fromView.screenshot)
        screenshotFromView.frame = fromView.frame
        
        // Prepare the screenshot of the destination view for animation
        let screenshotToView = UIImageView(image:selectedCell.screenshot)
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

            toViewController.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
            toViewController.navigationController?.navigationBar.shadowImage = nil
            toViewController.navigationController?.navigationBar.isTranslucent = true

        }) { _ in
            
            selectedCell.isHidden = false
            screenshotFromView.removeFromSuperview()
            screenshotToView.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            
        }
        
    }
}

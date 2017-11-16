//
//  FullDescriptionViewController.swift
//  VolgaFashion
//
//  Created by Syngmaster on 15/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

class FullDescriptionViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var animatableLabel: UILabel!
    var maxPosition:CGFloat = 20.0
    var minPosition:CGFloat = UIScreen.main.bounds.height - 170
    var progress: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(panGesture(sender:)))
        pan.delegate = self
        view.addGestureRecognizer(pan)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.frame = CGRect(x: 0, y: minPosition, width: view.frame.width, height: view.frame.height)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @objc func panGesture(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        self.progress = max(self.progress, fabs(translation.y/view.frame.width * 1.0))
        
        let minY = view.frame.minY
        
        if (minY + translation.y >= CGFloat(maxPosition)) && (minY + translation.y <= CGFloat(minPosition)) {
            view.frame = CGRect(x: 0, y: minY + translation.y, width: view.frame.width, height: view.frame.height)
            sender.setTranslation(.zero, in: view)
        }
        
        if (sender.state == .ended) {
            let duration: CGFloat = 0.5
            
            if velocity.y > 0 {
                animateView(duration: duration, velocity: velocity, toPosition: minPosition)
            } else {
                animateView(duration: duration, velocity: velocity, toPosition: maxPosition)
            }
        }
        animateParentView()
    }
    
    func animateView(duration: CGFloat, velocity: CGPoint, toPosition: CGFloat) {
        UIView.animate(withDuration: TimeInterval(duration), delay: 0.0, options: .allowUserInteraction, animations: {
            
            self.view.frame = CGRect(x: 0, y: toPosition, width: self.view.frame.width, height: self.view.frame.height)
            
        }) { (finished) in
            
            
        }
        animateParentView()
    }

    func animateParentView() {
        
        let parentVC = self.parent as! ItemDetailsViewController
        let positionY:CGFloat = maxPosition + 200
        
        if view.frame.origin.y <= positionY {
            UIView.animate(withDuration: 0.4, animations: {
                parentVC.imageSliderView.alpha = (self.view.frame.origin.y - self.maxPosition)/200.0
            })
            if view.frame.origin.y <= 20.0 {
                UIView.animate(withDuration: 0.4, animations: {
                    parentVC.navigationItem.title = "VINTAGE 80S JACKET"
                    self.animatableLabel.alpha = 0.0
                })
            } else {
                UIView.animate(withDuration: 0.4, animations: {
                    parentVC.navigationItem.title = ""
                    self.animatableLabel.alpha = 1.0
                })
            }

        } else {
            UIView.animate(withDuration: 0.4, animations: {
                parentVC.imageSliderView.alpha = 1.0
            })
            

        }
        
    }

}

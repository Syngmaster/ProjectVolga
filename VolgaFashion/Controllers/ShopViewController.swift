//
//  ShopViewController.swift
//  VolgaFashion
//
//  Created by Syngmaster on 13/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController, UINavigationControllerDelegate {
    
    var navTitle:String?
    var category:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.delegate = self
        
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "logo_icon.png")
        
        navigationItem.titleView = imageView

        navigationItem.backBarButtonItem?.title = ""
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
        let backButton = UIImage(named:"back_button_img.png")
        backButton?.withRenderingMode(.alwaysOriginal)
        navigationController?.navigationBar.backIndicatorImage = backButton
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButton
        
    }

    @IBAction func selectCategoryAction(_ sender: UIButton) {
        
        switch sender.tag {
        case 0: navTitle = "WOMEN"
        case 1: navTitle = "MEN"
        case 2: navTitle = "UNISEX"
        default: break
        }
        if sender.tag < 3 {
            self.performSegue(withIdentifier: "category", sender: nil)
        } else {
            self.performSegue(withIdentifier: "sale", sender: nil)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "category" {
            let dvc = segue.destination as! CategoryViewController
            dvc.navTitle = navTitle
        }
        
        if segue.identifier == "sale" {
            let dvc = segue.destination as! ItemsListViewController
            dvc.navTitle = "SALE"
            dvc.category = "SALE"
        }
        
    }
    
    // MARK: UINavigationControllerDelegate
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if (fromVC.isMember(of: ItemDetailsViewController.self) || toVC.isMember(of: ItemDetailsViewController.self)) {
            return PushAndPopAnimator(operation: operation)
        } else {
            return nil
        }
    }
    
}

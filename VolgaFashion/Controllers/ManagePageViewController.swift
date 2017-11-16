//
//  ManagePageViewController.swift
//  VolgaFashion
//
//  Created by Syngmaster on 15/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

class ManagePageViewController: UIPageViewController, UIPageViewControllerDelegate {
    
    var photos = ["002.png","004.png","005.png","006.png","007.png"]
    var currentIndex = 0
    var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        delegate = self
        
        if let vc = viewPhotoController(currentIndex) {
            let vcs = [vc]
            setViewControllers(vcs, direction: .forward, animated: false, completion: nil)
        }
        
        pageControl = UIPageControl(frame: CGRect(x: 0, y: view.frame.maxY - 140, width: view.frame.width, height: 50))
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.backgroundColor = UIColor.clear
        pageControl.numberOfPages = 5

        view.addSubview(pageControl)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addBottomVC()
    }
    
    func viewPhotoController(_ index: Int) -> ItemDetailsViewController? {
        if let storyboard = storyboard, let page = storyboard.instantiateViewController(withIdentifier: "ItemDetailsViewController") as? ItemDetailsViewController {

            return page
        }
        return nil
    }
    
    func addBottomVC() {
        if let bottomVC = storyboard?.instantiateViewController(withIdentifier: "FullDescriptionViewController") {
            addChildViewController(bottomVC)
            bottomVC.didMove(toParentViewController: self)
            bottomVC.view.frame = CGRect(x: 0, y: view.frame.maxY, width: view.frame.width, height: view.frame.height)
            
            view.addSubview(bottomVC.view)
            view.bringSubview(toFront: bottomVC.view)
        }
    }

}



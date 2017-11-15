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
        
        dataSource = self
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
            page.photoName = photos[index]
            page.photoIndex = index
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

//MARK: implementation of UIPageViewControllerDataSource

extension ManagePageViewController : UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let vc = viewController as? ItemDetailsViewController,
            let index = vc.photoIndex,
            index > 0 {
            return viewPhotoController(index - 1)
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let vc = viewController as? ItemDetailsViewController,
        let index = vc.photoIndex,
            (index + 1) < photos.count {
            return viewPhotoController(index + 1)
        }
        return nil
    
    }
    
    // MARK: UIPageViewControllerDelegate

    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
     
        if let contentVC = pendingViewControllers[0] as? ItemDetailsViewController {
            pageControl.currentPage = contentVC.photoIndex
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed {
            let contentVC = previousViewControllers[0] as! ItemDetailsViewController
            pageControl.currentPage = contentVC.photoIndex
        }
    }
    
}

//
//  ManagePageViewController.swift
//  VolgaFashion
//
//  Created by Syngmaster on 15/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

class ManagePageViewController: UIPageViewController {
    
    var photos = ["002.png","004.png","005.png","006.png","007.png"]
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        dataSource = self as UIPageViewControllerDataSource
        
        if let vc = viewPhotoController(currentIndex) {
            let vcs = [vc]
            setViewControllers(vcs, direction: .forward, animated: false, completion: nil)
        }
        
    }
    
    func viewPhotoController(_ index: Int) -> ItemDetailsViewController? {
        if let storyboard = storyboard, let page = storyboard.instantiateViewController(withIdentifier: "ItemDetailsViewController") as? ItemDetailsViewController {
            page.photoName = photos[index]
            page.photoIndex = index
            return page
        }
        return nil
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
    
    // MARK: UIPageControl
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return photos.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex 
    }
    
}

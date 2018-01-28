//
//  ItemDetailsViewController.swift
//  VolgaFashion
//
//  Created by Syngmaster on 15/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit
import FirebaseStorage

class ItemDetailsViewController: UIViewController {

    var selectedItem:ItemModel!
    var imageArray:[UIImage]!

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageSliderView: ImageSlideshow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageArray = [UIImage]()
        
        DispatchQueue.global(qos: .background).async {
            
            for photoURL in self.selectedItem.photoArray {
                self.loadImages(photoURL: photoURL)
            }
        }

        imageSliderView.contentScaleMode = .scaleAspectFill
        view.bringSubview(toFront: imageSliderView)
        
        // Do any additional setup after loading the view.
        addBottomVC()

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true

        activityIndicator.startAnimating()
    }
    
    func loadImages(photoURL: String) {
        
        let storage = FIRStorage.storage()
        let imageRef = storage.reference(forURL: photoURL)
        
        imageRef.data(withMaxSize: 1*2048*2048) { (data, error) in
            
            if let data = data {
                let image = UIImage(data:data)
                self.imageArray.append(image!)
                
                if self.imageArray.count == 5 {
                    self.setSliderView(images: self.imageArray)
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    func setSliderView(images: [UIImage]) {
        self.imageSliderView.setImageInputs([
            ImageSource(image:images[0]),
            ImageSource(image:images[1]),
            ImageSource(image:images[2]),
            ImageSource(image:images[3]),
            ImageSource(image:images[4])
            ])
    }

    
    func addBottomVC() {
        
        let bottomVC = storyboard?.instantiateViewController(withIdentifier: "FullDescriptionViewController") as! FullDescriptionViewController
        addChildViewController(bottomVC)
        bottomVC.didMove(toParentViewController: self)
        bottomVC.view.frame = CGRect(x: 0, y: view.frame.maxY, width: view.frame.width, height: view.frame.height)
        view.addSubview(bottomVC.view)
        
        
        if let buttonsVC = storyboard?.instantiateViewController(withIdentifier: "BottomButtonsViewController") {
            addChildViewController(buttonsVC)
            buttonsVC.didMove(toParentViewController: self)
            buttonsVC.view.frame = CGRect(x: 0, y: view.frame.maxY, width: view.frame.width, height: 50)
            
            view.addSubview(buttonsVC.view)
            view.bringSubview(toFront: buttonsVC.view)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

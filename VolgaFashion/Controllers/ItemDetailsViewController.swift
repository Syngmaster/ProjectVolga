//
//  ItemDetailsViewController.swift
//  VolgaFashion
//
//  Created by Syngmaster on 15/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

class ItemDetailsViewController: UIViewController {


    @IBOutlet weak var imageSliderView: ImageSlideshow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageSliderView.setImageInputs([
            ImageSource(image:UIImage(named:"002.png")!),
            ImageSource(image:UIImage(named:"004.png")!),
            ImageSource(image:UIImage(named:"005.png")!),
            ImageSource(image:UIImage(named:"006.png")!),
            ImageSource(image:UIImage(named:"007.png")!)
            
            ])
        imageSliderView.contentScaleMode = .scaleToFill
        view.bringSubview(toFront: imageSliderView)
        
        // Do any additional setup after loading the view.
        addBottomVC()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = UIColor.clear
        navigationController?.navigationBar.backgroundColor = UIColor.clear

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = UIColor(red: (255.0 / 255.0), green: (255.0 / 255.0), blue: (255.0 / 255.0), alpha: 1)


    }

    
    func addBottomVC() {
        if let bottomVC = storyboard?.instantiateViewController(withIdentifier: "FullDescriptionViewController") {
            addChildViewController(bottomVC)
            bottomVC.didMove(toParentViewController: self)
            bottomVC.view.frame = CGRect(x: 0, y: view.frame.maxY, width: view.frame.width, height: view.frame.height)
            
            view.addSubview(bottomVC.view)
            //view.bringSubview(toFront: bottomVC.view)
        }
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

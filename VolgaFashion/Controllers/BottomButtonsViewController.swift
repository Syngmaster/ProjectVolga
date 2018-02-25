//
//  BottomButtonsViewController.swift
//  VolgaFashion
//
//  Created by Syngmaster on 16/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

class BottomButtonsViewController: UIViewController {
    
    @IBOutlet weak var addToBasketButton: UIButton!
    @IBOutlet weak var addToWishlistButton: UIButton!

    var item:ItemModel!
    var minPosition:CGFloat = UIScreen.main.bounds.height - 50

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func updateButtons() {
        if item.isWishlisted {
            updateButton(button: addToWishlistButton, title: "REMOVE FROM WISHLIST", fontSize: 12)
        } else {
            updateButton(button: addToWishlistButton, title: "ADD TO WISHLIST", fontSize: 15)
        }
        
        if item.isInBasket {
            updateButton(button: addToBasketButton, title: "REMOVE FROM BASKET", fontSize: 12)
        } else {
            updateButton(button: addToBasketButton, title: "ADD TO BASKET", fontSize: 15)
        }
    }
    
    func updateButton(button: UIButton, title: String!, fontSize: CGFloat!) {
        UIView.setAnimationsEnabled(false)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont(name: "Gotham-Book", size: fontSize)
        button.layoutIfNeeded()
        UIView.setAnimationsEnabled(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.frame = CGRect(x: 0, y: minPosition, width: view.frame.width, height: view.frame.height)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateButtons()

    }

    @IBAction func addToWishlistAction(_ sender: UIButton) {
        if item.isWishlisted {
            item.isWishlisted = false
            updateButton(button: addToWishlistButton, title: "ADD TO WISHLIST", fontSize: 15)
        } else {
            item.isWishlisted = true
            updateButton(button: addToWishlistButton, title: "REMOVE FROM WISHLIST", fontSize: 12)
        }
    }
    
    @IBAction func addToBasketAction(_ sender: UIButton) {
        if item.isInBasket {
            item.isInBasket = false
            updateButton(button: addToBasketButton, title: "ADD TO BASKET", fontSize: 15)
        } else {
            item.isInBasket = true
            updateButton(button: addToBasketButton, title: "REMOVE FROM BASKET", fontSize: 12)
        }
    }
}

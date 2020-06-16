//
//  ShoppingBasketTableViewCell.swift
//  EasyShopper
//
//  Created by Joseph Umoru on 13/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import UIKit
import Kingfisher

/*
 Description: A subclass of the UITableViewCell class
 property1: productImage
 property2: productName
 property3: productQuantity
 property4: spinner
 property5: productPrice
 method1: prepareForReuse
 method2: awakeFromNib
 method3: setSelected
       parameter1: selected
       parameter2: animated
 method4: configure
       parameter: productData
*/

class ShoppingBasketTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productQuantity: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configure(with: .none)
        productImage.image = UIImage(named: "avatar")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        spinner.color = KachingTheme.colorChoice
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /*
     Description: sets the value for the view objects in the ShoppingBasketTableViewCell
     */
    func configure(with productData: ShoppingBasket?) {
        if let result = productData {
            productName.text = result.name
            productQuantity.text = "\(result.quantity)"
            productPrice.text = "\(result.retailPrice) DKK"
            guard let imageUrl = URL(string: result.imageUrl) else {
                return
            }
            
            productImage.kf.setImage(with: imageUrl)
            spinner.stopAnimating()
        } else {
            spinner.startAnimating()
        }
    }

}

//
//  ProductsTableViewCell.swift
//  EasyShopper
//
//  Created by Joseph Umoru on 15/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import UIKit
import Kingfisher

/*
 Description: A subclass of the UITableViewCell class
 property1: productImage
 property2: productName
 property3: productPrice
 property4: spinner
 method1: prepareForReuse
 method2: awakeFromNib
 method3: setSelected
       parameter1: selected
       parameter2: animated
method4: configure
       parameter: productData
*/

class ProductsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /*
     Description: sets the value for the view objects in the ShoppingBasketTableViewCell
     */
    func configure(with productData: Product?) {
        if let result = productData {
            productName.text = result.name
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

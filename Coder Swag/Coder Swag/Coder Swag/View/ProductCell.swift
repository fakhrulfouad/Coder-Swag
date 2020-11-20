//
//  ProductCell.swift
//  Coder Swag
//
//  Created by Muhammad Fakhrulghazi bin Mohd Fouad on 19/11/2020.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    // all we doing here with func below is that everytime a collectionview cell is created or dequeued, we're gonna pass in the appropriate product and update the view so its showing the correct data. This is important because views on a collectionview and tableview are recycled. So we have to continually update the views.
    
    
    func updateViews(product: Product) {
        productImage.image = UIImage(named: product.imageName)
        productTitle.text = product.title
        productPrice.text = product.price
    }
    
}

//
//  CategoryCell.swift
//  Coder Swag
//
//  Created by Muhammad Fakhrulghazi bin Mohd Fouad on 17/11/2020.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    func updateViews(category: Category) {
        categoryImage.image = UIImage(named: category.imageName)
        categoryTitle.text = category.title
    }

}

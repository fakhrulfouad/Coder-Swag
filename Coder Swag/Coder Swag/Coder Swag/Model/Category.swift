//
//  Category.swift
//  Coder Swag
//
//  Created by Muhammad Fakhrulghazi bin Mohd Fouad on 18/11/2020.
//

import Foundation


struct Category {
    private(set) public var title: String
    private(set) public var imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}

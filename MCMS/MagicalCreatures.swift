//
//  MagicalCreatures.swift
//  MCMS
//
//  Created by Justine Linscott on 5/21/19.
//  Copyright © 2019 Justine Linscott. All rights reserved.
//

import Foundation
import UIKit


class MagicalCreatures {
    
    var name: String
    var detail: String
    var image: UIImage
    var accessories: [String]?
    
    init(name: String, detail: String, image: UIImage) {
        self.name = name
        self.detail = detail
        self.image = image
    }
    
    init(name: String, detail: String, image: UIImage, accessories: [String]) {
        self.name = name
        self.detail = detail
        self.image = image
        self.accessories = accessories
    }
    
    
    
}

//
//  CatModel.swift
//  Cats!
//
//  Created by Oleh Pazynich on 2022/04/22.
//

import Foundation


struct Responce : Codable {
    var object: [Cat]
}

struct Cat : Codable, Hashable {
    var id: String
    var url: String
    
    init() {
        self.id = ""
        self.url = "https://25.media.tumblr.com/tumblr_m2dzunsLLU1r30oy5o1_250.jpg"
    }
}

//
//  AlbumEntity.swift
//  iTunes Albums
//
//  Created by Sergei Romanchuk on 08.08.2021.
//

import Foundation

// MARK: - Album Entity
struct AlbumEntity: AlbumEntityProtocol {
    let id: String?
    var title: String?
    var imageUrl: String?
    
    init(title: String, url imageUrl: String) {
        self.id = UUID().uuidString
        self.title = title
        self.imageUrl = imageUrl
    }
    
}

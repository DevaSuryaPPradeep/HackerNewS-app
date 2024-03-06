//
//  PostData.swift
//  HackerNews
//
//  Created by Devasurya on 05/03/24.
//

import Foundation

/// Model
struct Results:Decodable {
    let hits:[ Post]
}

struct Post:Decodable,Identifiable {
    var id: String {
        return objectID
    }
    var objectID :String
    var points: Int
    var title: String
    var url: String?
    
}

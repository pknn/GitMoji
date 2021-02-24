//
//  Gitmoji.swift
//  GitMoji
//
//  Created by Pakanon Pantisawat on 23/02/2021.
//

import Foundation

struct GitMoji: Hashable, Codable {
    var emoji: String
    var entity: String
    var code: String
    var description: String
    var name: String
}

func loadData<T: Decodable>() -> T {
    guard let file = Bundle.main.url(forResource: "gitmoji", withExtension: "json") else {
        fatalError()
    }
    
    do {
        let data = try Data(contentsOf: file)
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("\(error)")
    }
}

var gitmojis: [GitMoji] = loadData()


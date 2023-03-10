//
//  Shelters.swift
//  HelpPaw
//
//  Created by Roman Lantsov on 09.03.2023.
//

import Foundation


struct Shelter {
    let city: City
    let name: String
    let address: String
    
    let animals: [Animal]
    
    static func getShelters() -> [Shelter] {
        DataManager.shared.shelters
    }
}
struct Animal {
    let type: Breed
    let name: String
    let age: Int
    let description: String
}

enum City: String, CaseIterable {
    case moscow = "Москва"
    case stPeterburg = "Санкт-петербург"
    case tumen = "Тюмень"
    case ekaterinburg = "Екатеринбург"
    case krasnodar = "Краснодар"
    case nizhnyNovgorod = "Нижний Новгород"
}

enum Breed: String {
    case dog = "Собака"
    case cat = "Кошка"
}




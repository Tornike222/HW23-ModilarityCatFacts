//
//  FactsModel.swift
//  CatFacts
//
//  Created by telkanishvili on 01.05.24.
//

import Foundation

struct Fact: Decodable {
    var fact: String?
}

struct Data: Decodable {
    var data: [Fact]
}

var catFactsArray = [Fact()]


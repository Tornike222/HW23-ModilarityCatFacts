//
//  CatFactViewModel.swift
//  CatFacts
//
//  Created by telkanishvili on 02.05.24.
//

import Foundation

class CatFactCellViewModel {
    private var fact: Fact
    
    init(fact: Fact) {
        self.fact = fact
    }
    
    var catFact: String {
        fact.fact ?? ""
    }
}

//
//  CatFactsViewModel.swift
//  CatFacts
//
//  Created by telkanishvili on 01.05.24.
//

import Foundation
import NetworkPackage

protocol CatFactsViewModelDelegate: AnyObject{
    func reloadCatTableView()
}

class CatFactsViewModel {
    weak var delegate: CatFactsViewModelDelegate?
    var catFactCellViewModel: [CatFactCellViewModel] = []

    func fetchData(){
        let urlString = "https://catfact.ninja/facts?max_length=45&limit=100"
        NetworkService().getData(urlString: urlString) { (result: Data?, Error) in
            guard let result = result else { return }
            
            catFactsArray = result.data
            self.catFactCellViewModel = result.data.map{
                CatFactCellViewModel(fact: $0)
            }
            self.delegate?.reloadCatTableView()

        }
    }
}



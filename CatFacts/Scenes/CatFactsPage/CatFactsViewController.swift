//
//  ViewController.swift
//  CatFacts
//
//  Created by telkanishvili on 01.05.24.
//

import UIKit
import TinyConstraints



class CatFactsViewController: UIViewController {
    
    var catFactsViewModel = CatFactsViewModel()
    
    let factsTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catFactsViewModel.fetchData()
        catFactsViewModel.delegate = self
        
        setupUI()
    }
    
    func setupUI() {
        addFactsTableView()
        addBackgroundColor()
    }
    
    func addBackgroundColor() {
        view.backgroundColor = .white
    }
    func addFactsTableView() {
        view.addSubview(factsTableView)
        
        factsTableView.edgesToSuperview()
        factsTableView.allowsSelection = false
        factsTableView.dataSource = self
        factsTableView.register(CatFactTableViewCell.self, forCellReuseIdentifier: "FactsTableView")
    }
}

extension CatFactsViewController: CatFactsViewModelDelegate {
    func reloadCatTableView(){
        DispatchQueue.main.async {
            self.factsTableView.reloadData()
        }
    }
}

extension CatFactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catFactsViewModel.catFactCellViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = factsTableView.dequeueReusableCell(withIdentifier: "FactsTableView", for: indexPath) as? CatFactTableViewCell
        let catFactCellViewModel = catFactsViewModel.catFactCellViewModel[indexPath.row]
        cell?.catFactLabel.text = catFactCellViewModel.catFact
        
        return cell ?? CatFactTableViewCell()
    }
    
}


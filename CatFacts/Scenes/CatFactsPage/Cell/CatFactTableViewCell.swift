//
//  CatFactTableViewCell.swift
//  CatFacts
//
//  Created by telkanishvili on 02.05.24.
//

import UIKit

class CatFactTableViewCell: UITableViewCell {
    
    let catFactLabel: UILabel = {
        let catFactLabel = UILabel()
        catFactLabel.translatesAutoresizingMaskIntoConstraints = false
        catFactLabel.numberOfLines = 0
        return catFactLabel
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()

    }
    
    func setupUI() {
        addCountryLabel()
    }
    
    func addCountryLabel() {
        contentView.addSubview(catFactLabel)
        
        catFactLabel.left(to: contentView, offset: 15) 
    }

}

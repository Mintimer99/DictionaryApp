//
//  WordTVCell.swift
//  DictionaryApp
//
//  Created by Минтимер Харасов on 22.03.2022.
//

import UIKit

class WordTVCell: UITableViewCell {

    @IBOutlet weak var wordLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

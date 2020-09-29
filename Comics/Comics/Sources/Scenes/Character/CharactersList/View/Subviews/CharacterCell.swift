//
//  CharacterCell.swift
//  Comics
//
//  Created by dubkov on 28.09.2020.
//  Copyright © 2020 dubkov. All rights reserved.
//

import UIKit

final class CharacterCell: UITableViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var deckLabel: UILabel!
    @IBOutlet private weak var createDateLabel: UILabel!
    
    private let dateFormatter = DateFormatter(dateFormat: "MMMM d, YYYY")
    
    override func layoutSubviews() {
        super.layoutSubviews()
        DispatchQueue.main.async {
            self
                .containerView
                .applyShadow()
        }
    }
    
    func render(with character: Character) {
        authorLabel.text = character.name
        deckLabel.text = character.deck.or("No description")
        createDateLabel.text = dateFormatter.string(from: character.dateAdded)
    }
    
    func highlighting(_ isHighlight: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.transform =
                isHighlight ?
                    CGAffineTransform(scaleX: 0.95, y: 0.95) :
                    CGAffineTransform.identity
            self.layoutIfNeeded()
        }
    }
}

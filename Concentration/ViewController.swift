//
//  ViewController.swift
//  Concentration
//
//  Created by Максим Чесников on 13.01.2020.
//  Copyright © 2020 Максим Чесников. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var themeInt: Int!
    var emojiChoies: [String]!
    var numberOfPairsOfCards: Int
    {
        return (cardButtons.count + 1) / 2
    }
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var flipCountLabel: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBAction func touchCard(_ sender: UIButton)
    {
        if let cardNumber = cardButtons.firstIndex(of: sender)
        {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            flipCountLabel.text = "Flips: \(game.flipCount)"
        }
        else
        {
            print("choosen card isn't game")
        }
        scoreLabel.text = "\(game.score)"
        
    }
    
    func updateViewFromModel()
    {
        for index in cardButtons.indices
        {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp
            {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else
            {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.6770584579, green: 0.5820367521, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5254901961, blue: 0.2117647059, alpha: 1)
            }
        }
    }
    
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String
    {
        
        if emoji[card.identifier] == nil, emojiChoies.count > 0
        {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoies.count)))
            emoji[card.identifier] = emojiChoies.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    @IBAction func newGameAction(_ sender: Any) {
        
        
        emojiChoies = [""]
        emoji.removeAll()
        game.newGame()
        scoreLabel.text = "\(game.score)"
        let randomIndex = Int(arc4random_uniform(UInt32(game.theme.emojiChoies.count)))
        emojiChoies = game.theme.getEmojiForInt(index: randomIndex)
        print(emojiChoies[0])
        updateViewFromModel()
        flipCountLabel.text = "Flips: \(game.flipCount)"
    }
    
    
}


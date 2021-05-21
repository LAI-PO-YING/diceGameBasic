//
//  ViewController.swift
//  diceGameBasic
//
//  Created by Lai Po Ying on 2021/5/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var leftDiceImageViews: [UIImageView]!
    @IBOutlet var rightDiceImageViews: [UIImageView]!
    @IBOutlet weak var leftSubtotalLabel: UILabel!
    @IBOutlet weak var rightSubtotalLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    let player = AVPlayer()
    
    func dice() {
        var leftSubtotal = 0
        var rightSubtotal = 0
        var total = 0
        let fileURL = Bundle.main.url(forResource: "diceSound", withExtension: "mp3")!
        let playItem = AVPlayerItem(url: fileURL)
        player.replaceCurrentItem(with: playItem)
        player.play()
        for diceImage in leftDiceImageViews {
            let index = Int.random(in: 1...6)
            diceImage.image = UIImage.init(systemName: "die.face.\(index).fill")
            leftSubtotal += index
        }
        for diceImage in rightDiceImageViews {
            let index = Int.random(in: 1...6)
            diceImage.image = UIImage.init(systemName: "die.face.\(index).fill")
            rightSubtotal += index
        }
        total = leftSubtotal + rightSubtotal
        leftSubtotalLabel.text = "\(leftSubtotal)"
        rightSubtotalLabel.text = "\(rightSubtotal)"
        totalLabel.text = "\(total)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for defaultDiceImage in leftDiceImageViews {
            defaultDiceImage.image = UIImage.init(systemName: "die.face.1.fill")
        }
        for defaultDiceImage in rightDiceImageViews {
            defaultDiceImage.image = UIImage.init(systemName: "die.face.1.fill")
        }
        leftSubtotalLabel.text = "3"
        rightSubtotalLabel.text = "3"
        totalLabel.text = "6"
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
       if motion == .motionShake {
        dice()
       }
    }
    
    @IBAction func diceButtonPressed(_ sender: UIButton) {
        dice()
    }
    

}


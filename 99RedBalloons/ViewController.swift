//
//  ViewController.swift
//  99RedBalloons
//
//  Created by ryan on 2015-05-28.
//  Copyright (c) 2015 Ryan Maule. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var balloonNameLabel: UILabel!
    @IBOutlet weak var balloonImage: UIImageView!
    
    var currentIndex = 0
    var redBalloons: [RedBalloon] = []
    var appRandom = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.balloonImage.image = UIImage(named: "BerlinTVTower.jpg")
        self.balloonNameLabel.text = "Berlin TV Tower"
        
        var balloonImages: [String] = []
        for var balloonImage = 1; balloonImage <= 4; balloonImage++ {
            balloonImages.append("RedBalloon\(balloonImage).jpg")
        }
        
        for var balloon = 1; balloon <= 99; balloon++ {
            var newBalloon = RedBalloon()
            var randomBalloon = Int(arc4random_uniform(UInt32(balloonImages.count)))
            
            newBalloon.image = UIImage(named: balloonImages[randomBalloon])
            
//            switch randomBalloon {
//            case 1:
//                newBalloon.image = UIImage(named: "RedBalloon1.jpg")
//            case 2:
//                newBalloon.image = UIImage(named: "RedBalloon2.jpg")
//            case 3:
//                newBalloon.image = UIImage(named: "RedBalloon3.jpg")
//            default:
//                newBalloon.image = UIImage(named: "RedBalloon4.jpg")
//            }
            
            newBalloon.name = "Balloon #\(balloon)"
            
            self.redBalloons.append(newBalloon)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBalloonButtonPressed(sender: UIBarButtonItem) {
        var nextBalloon: RedBalloon
        if self.appRandom {
            var randomIndex: Int
            do {
                randomIndex = Int(arc4random_uniform(UInt32(self.redBalloons.count)))
            }
                while self.currentIndex == randomIndex
            nextBalloon = self.redBalloons[randomIndex]
        }
        else {
            nextBalloon = self.redBalloons[self.currentIndex]
        
            if self.currentIndex < 98 {
                self.currentIndex++
            }
            else {
                self.currentIndex = 0;
            }
        }
        self.balloonImage.image = nextBalloon.image
        self.balloonNameLabel.text = nextBalloon.name
    }

}


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
            newBalloon.image = UIImage(named: "BerlinTVTower.jpg")
            newBalloon.name = "Balloon #\(balloon)"
            redBalloons.append(newBalloon)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBalloonButtonPressed(sender: UIBarButtonItem) {
        var randomIndex: Int
        do {
            randomIndex = Int(arc4random_uniform(UInt32(redBalloons.count)))
        }
        while currentIndex == randomIndex
        
        var nextBalloon = redBalloons[randomIndex]
        
        self.balloonImage.image = nextBalloon.image
        self.balloonNameLabel.text = nextBalloon.name
    }

}


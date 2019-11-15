//
//  Game.swift
//  IOSProject
//
//  Created by Steven on 4/22/19.
//  Copyright © 2019 Steven. All rights reserved.
//

import UIKit

public class Game: UIViewController{
    
    var numPlayer: Int?

    var player1: Player?
    var player2: Player?
    var player3: Player?
    var player4: Player?
    
    @IBOutlet weak var player1ScoreCard: UIView!
    @IBOutlet weak var player2ScoreCard: UIView!
    @IBOutlet weak var player3ScoreCard: UIView!
    @IBOutlet weak var player4ScoreCard: UIView!
    
    @IBOutlet weak var lblPlayer1Name: UILabel!
    @IBOutlet weak var lblPlayer2Name: UILabel!
    @IBOutlet weak var lblPlayer3Name: UILabel!
    @IBOutlet weak var lblPlayer4Name: UILabel!
    
    @IBOutlet weak var lblPlayer1Lifepoints: UILabel!
    @IBOutlet weak var lblPlayer2Lifepoints: UILabel!
    @IBOutlet weak var lblPlayer3Lifepoints: UILabel!
    @IBOutlet weak var lblPlayer4Lifepoints: UILabel!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        if numPlayer == 3{
            player3ScoreCard.isHidden = false
            lblPlayer3Name.text = player3!._name
            lblPlayer3Lifepoints.text = "\(player3!._lifepoints ?? 0000)"
        } else if numPlayer == 4 {
            player3ScoreCard.isHidden = false
            player4ScoreCard.isHidden = false
            lblPlayer3Name.text = player3!._name
            lblPlayer3Lifepoints.text = "\(player3!._lifepoints ?? 0000)"
            lblPlayer4Name.text = player4!._name
            lblPlayer4Lifepoints.text = "\(player4!._lifepoints ?? 0000)"
        }
        lblPlayer1Name.text = player1!._name
        lblPlayer2Name.text = player2!._name
        
        lblPlayer1Lifepoints.text = "\(player1!._lifepoints ?? 0000)"
        lblPlayer2Lifepoints.text = "\(player2!._lifepoints ?? 0000)"

    }
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GameToCalc"{
            let selectForDamage = segue.destination as! SelectPlayersToDamage
            selectForDamage.numPlayer = numPlayer
            selectForDamage.player1 = player1
            selectForDamage.player2 = player2
            selectForDamage.player3 = player3
            selectForDamage.player4 = player4
        } 
    }
}

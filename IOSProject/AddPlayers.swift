//
//  AddPlayers.swift
//  IOSProject
//
//  Created by Steven on 4/22/19.
//  Copyright © 2019 Steven. All rights reserved.
//

import UIKit

public class AddPlayer: UIViewController{
    
    var lifepointsSelected: Int?
    var numPlayers: Int?
    
    var player1: Player?
    var player2: Player?
    var player3: Player?
    var player4: Player?
    
    @IBOutlet weak var txtplayer1Name: UITextField!
    @IBOutlet weak var txtplayer2Name: UITextField!
    @IBOutlet weak var txtplayer3Name: UITextField!
    @IBOutlet weak var txtplayer4Name: UITextField!
    
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        print("\(String(describing: lifepointsSelected))")
        if numPlayers == 3{
            txtplayer3Name.isHidden = false
        } else if numPlayers == 4{
            txtplayer3Name.isHidden = false
            txtplayer4Name.isHidden = false
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer){
        txtplayer1Name.resignFirstResponder()
        txtplayer2Name.resignFirstResponder()
        txtplayer3Name.resignFirstResponder()
        txtplayer4Name.resignFirstResponder()
    }
    
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPlayersToGame"{
            player1 = Player(name: txtplayer1Name.text!, lifepoints: lifepointsSelected!)
            player2 = Player(name: txtplayer2Name.text!, lifepoints: lifepointsSelected!)
            if(txtplayer3Name.isHidden == false){
                player3 = Player(name: txtplayer3Name.text!, lifepoints: lifepointsSelected!)
            }
            if(txtplayer4Name.isHidden == false){
                player4 = Player(name: txtplayer4Name.text!, lifepoints: lifepointsSelected!)
            }
            let gamePlay = segue.destination as! Game
            gamePlay.numPlayer = numPlayers
            gamePlay.player1 = player1
            gamePlay.player2 = player2
            gamePlay.player3 = player3
            gamePlay.player4 = player4
        }
    }
}

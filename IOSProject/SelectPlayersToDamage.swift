//
//  SelectPlayersToDamage.swift
//  IOSProject
//
//  Created by Steven on 4/29/19.
//  Copyright © 2019 Steven. All rights reserved.
//

import UIKit

public class SelectPlayersToDamage: UIViewController{
    
    var numPlayer: Int?
    
    var player1: Player?
    var player2: Player?
    var player3: Player?
    var player4: Player?
    
    @IBOutlet weak var vwPlayer1Select: UIView!
    @IBOutlet weak var vwPlayer2Select: UIView!
    @IBOutlet weak var vwPlayer3Select: UIView!
    @IBOutlet weak var vwPlayer4Select: UIView!
    
    @IBOutlet weak var lblplayer1Name: UILabel!
    @IBOutlet weak var lblplayer2Name: UILabel!
    @IBOutlet weak var lblplayer3Name: UILabel!
    @IBOutlet weak var lblplayer4Name: UILabel!
    
    @IBOutlet weak var player1CheckBox: CheckBox!
    @IBOutlet weak var player2CheckBox: CheckBox!
    @IBOutlet weak var player3CheckBox: CheckBox!
    @IBOutlet weak var player4CheckBox: CheckBox!
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        lblplayer1Name.text = player1?._name
        lblplayer2Name.text = player2?._name
        if numPlayer == 3 || numPlayer == 4{
            vwPlayer3Select.isHidden = false
            lblplayer3Name.text = player3?._name
        }
        if numPlayer == 4{
            vwPlayer4Select.isHidden = false
            lblplayer4Name.text = player4?._name
        }
        
    }
    
    
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playersToDamage" || segue.identifier == "playersToRestore"{
            if player1CheckBox.isChecked == false && player2CheckBox.isChecked == false && player3CheckBox.isChecked == false && player4CheckBox.isChecked == false{
                messageAlert(title: "No Players Selected", message: "Please select a Player")
                return
            } else {
                let calc = segue.destination as! Calc
                calc.numPlayers = numPlayer
                calc.player1Checked = player1CheckBox.isChecked
                calc.player2Checked = player2CheckBox.isChecked
                calc.player3Checked = player3CheckBox.isChecked
                calc.player4Checked = player4CheckBox.isChecked
                
                if segue.identifier == "playersToDamage"{
                    calc.player1Damage = player1
                    calc.player2Damage = player2
                    calc.player3Damage = player3
                    calc.player4Damage = player4
                } else if segue.identifier == "playersToRestore"{
                    calc.player1Restore = player1
                    calc.player2Restore = player2
                    calc.player3Restore = player3
                    calc.player4Restore = player4
                }
            }
        } else {
            let game = segue.destination as! Game
            game.player1 = player1
            game.player2 = player2
            game.player3 = player3
            game.player4 = player4
        }
    }
    

    
    func messageAlert(title: String, message: String){
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
    }
    
}

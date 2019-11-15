//
//  DamageCalc.swift
//  IOSProject
//
//  Created by Steven Cardona on 4/29/19.
//  Copyright © 2019 Steven. All rights reserved.
//

import UIKit

public class Calc: UIViewController{
    
    enum numErrors: Error{
        case numNotEntered
    }
    
    var numPlayers: Int?
    
    var player1Damage: Player?
    var player2Damage: Player?
    var player3Damage: Player?
    var player4Damage: Player?
    
    var player1Checked: Bool?
    var player2Checked: Bool?
    var player3Checked: Bool?
    var player4Checked: Bool?
    
    @IBOutlet weak var txtDamageAmount: UITextField!
    
    var player1Restore: Player?
    var player2Restore: Player?
    var player3Restore: Player?
    var player4Restore: Player?

    public override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    public func damage(player: Player, damage: String) -> Int{
        var result: Int = 0
        if Int(damage)! > 0{
            result = player._lifepoints! - Int(damage)!
        } else {
            validationError(title: "Invalid Number", message: "Please enter a positive whole number")
        }
        return result
    }
    
    public func restore(player: Player, restore: String) -> Int{
        var result: Int = 0
        if Int(restore)! > 0{
            result = player._lifepoints! + Int(restore)!
        } else {
            validationError(title: "Invalid Number", message: "Please enter a positive whole number")
        }
        return result
    }
    
    func validationError(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)}))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func calculateDamage() throws {
        if txtDamageAmount.text == "0" || txtDamageAmount.text!.isEmpty{
            throw numErrors.numNotEntered
        }
        if player1Checked == true{
            player1Damage?._lifepoints = damage(player: player1Damage!, damage: txtDamageAmount.text!)
        }
        if player2Checked == true{
            player2Damage?._lifepoints = damage(player: player2Damage!, damage: txtDamageAmount.text!)
        }
        if player3Checked == true {
            player3Damage?._lifepoints = damage(player: player3Damage!, damage: txtDamageAmount.text!)
        }
        if player4Checked == true {
            player4Damage?._lifepoints = damage(player: player4Damage!, damage: txtDamageAmount.text!)
        }
    }
    
    func calculateRestore() throws {
        if txtDamageAmount.text == "0" || txtDamageAmount.text!.isEmpty{
            throw numErrors.numNotEntered
        }
        if player1Checked == true{
            player1Restore?._lifepoints = restore(player: player1Restore!, restore: txtDamageAmount.text!)
        }
        if player2Checked == true{
            player2Restore?._lifepoints = restore(player: player2Restore!, restore: txtDamageAmount.text!)
        }
        if player3Checked == true {
            player3Restore?._lifepoints = restore(player: player3Restore!, restore: txtDamageAmount.text!)
        }
        if player4Checked == true {
            player4Restore?._lifepoints = restore(player: player4Restore!, restore: txtDamageAmount.text!)
        }
    }
    
    // TODO: Work on getting this working!
    @IBAction func CalcTapped(_ sender: Any) {
        if player1Damage != nil{
            do{
                try calculateDamage()
                messageAlert(title: "Calculation done", message: "Please Press \"Done\" to continue game")
            } catch {
                messageAlert(title: "No Valid Value", message: "Please enter a postive whole number")
            }
        } else if player1Restore != nil {
            do{
                try calculateRestore()
                messageAlert(title: "Calculation done", message: "Please Press \"Done\" to continue game")
            } catch {
                messageAlert(title: "No Valid Value", message: "Please enter a postive whole number")
            }
        }
        
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer){
        txtDamageAmount.resignFirstResponder()
    }
    
    func messageAlert(title: String, message: String){
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let game = segue.destination as! Game
        game.numPlayer = numPlayers
        if player1Damage != nil{
            game.player1 = player1Damage
            game.player2 = player2Damage
            game.player3 = player3Damage
            game.player4 = player4Damage
        } else if player1Restore != nil{
            game.player1 = player1Restore
            game.player2 = player2Restore
            game.player3 = player3Restore
            game.player4 = player4Restore
        }
    }

}

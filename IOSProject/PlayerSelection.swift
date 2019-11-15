//
//  PlayerSelection.swift
//  IOSProject
//
//  Created by Steven on 4/16/19.
//  Copyright © 2019 Steven. All rights reserved.
//

import UIKit

public class PlayerSelection: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var playerSelect: [Int]!
    var lifepointSelect: [Int]!
    
    
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var lblPlayers: UITextField!
    @IBOutlet weak var pkUserChoices: UIPickerView!
    @IBOutlet weak var pkLifepionts: UIPickerView!
    @IBOutlet weak var lblLifepoints: UITextField!
    
    @IBOutlet weak var vwPickerView: UIView!
    @IBAction func btnNumPlayerChange(_ sender: Any) {
        vwPickerView.isHidden = false
        pkUserChoices.isHidden = false
        pkLifepionts.isHidden = true
        btnSubmit.isHidden = true
    }
    
    @IBAction func btnChangeLifepoints(_ sender: Any) {
        vwPickerView.isHidden = false
        pkUserChoices.isHidden = true
        pkLifepionts.isHidden = false
        btnSubmit.isHidden = true
    }
    override public func viewDidLoad() {
        super.viewDidLoad()
        pkUserChoices.delegate = self
        pkUserChoices.dataSource = self
        pkLifepionts.delegate = self
        pkLifepionts.dataSource = self
        playerSelect = [2, 3, 4]
        lifepointSelect = [2000, 4000, 8000]
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{
            return playerSelect.count
        } else {
            return lifepointSelect.count
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            return String(playerSelect![row])
        } else {
            return String(lifepointSelect![row])
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1{
            let playerSelection = playerSelect[row]
            lblPlayers.text = "\(playerSelection)"
        } else {
            let lifepointSelection = lifepointSelect[row]
            lblLifepoints.text = "\(lifepointSelection)"
        }
    }
    
    @IBAction func btnPickerDone(_ sender: Any) {
        vwPickerView.isHidden = true
        btnSubmit.isHidden = false
    }

    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addPlayerName = segue.destination as! AddPlayer
        addPlayerName.lifepointsSelected = Int(lblLifepoints.text!)
        let numberOfPlayers = segue.destination as! AddPlayer
        numberOfPlayers.numPlayers = Int(lblPlayers.text!)
    }
}



//
//  CheckBox.swift
//  IOSProject
//
//  Created by Steven on 4/29/19.
//  Copyright © 2019 Steven. All rights reserved.
//

import UIKit

public class CheckBox: UIButton{
    
    let checkedImage = UIImage(named: "checked_checkbox")! as UIImage
    
    
    var isChecked: Bool = false{
        didSet{
            
            if isChecked == true{
                self.setImage(checkedImage, for: UIControl.State.normal)
                self.imageView?.contentMode = .scaleAspectFill
            } else {
                self.setImage(nil, for: .normal)
                self.layer.borderWidth = 2
                self.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
        }
    }
    
    override public func awakeFromNib(){
        self.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton){
        if sender == self{
            isChecked = !isChecked
        }
    }
    
}

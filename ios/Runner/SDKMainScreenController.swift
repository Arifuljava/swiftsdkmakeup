//
//  SDKMainScreenController.swift
//  Runner
//
//  Created by sang on 2/10/23.
//

import UIKit

class SDKMainScreenController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var print_button: UIButton!
    @IBOutlet weak var rint_speed: UITextField!
    @IBOutlet weak var density: UITextField!
    @IBOutlet weak var print_copy: UITextField!
    @IBOutlet weak var connectedview: UIView!
    @IBOutlet weak var connectedlabel: UILabel!
    @IBOutlet weak var bitmapimage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //management input intext
        rint_speed.delegate = self
            print_copy.delegate = self
        density.delegate = self
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == rint_speed || textField == print_copy || textField == density {
            // Check if the input string is empty (e.g., pasting non-numeric characters)
            if string.isEmpty {
                return true
            }
            
            // Create a character set that allows only digits
            let allowedCharacterSet = CharacterSet(charactersIn: "0123456789")
            let inputCharacterSet = CharacterSet(charactersIn: string)
            
            // Check if the input string contains only digits
            if allowedCharacterSet.isSuperset(of: inputCharacterSet) {
                // Check if the resulting text length after the change is within the limit
                let currentText = textField.text ?? ""
                let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
                return newText.count <= 5
            } else {
                // Reject non-numeric characters
                return false
            }
        }
        
        // Allow input for other text fields
        return true
    }

}

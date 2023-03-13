//
//  UserProfileViewController.swift
//  HelpPaw
//
//  Created by Виктория Страдзина on 11.03.2023.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var addressOfResidenceTextField: UITextField!
    @IBOutlet var contactNumberTextField: UITextField!
    @IBOutlet var childrenTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(doneButtonPressed)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
        
        contactNumberTextField.inputAccessoryView = keyboardToolbar
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func doneButtonPressed() {
        view.endEditing(true)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func sendQuestionnaire() {
        let questionnaireTextFields = [userNameTextField, addressOfResidenceTextField, contactNumberTextField, childrenTextField]
        
        var allFieldsFilled = true
        for questionnaireTextField in questionnaireTextFields {
            guard let text = questionnaireTextField?.text, !text.isEmpty else {
                allFieldsFilled = false
                break
            }
        }
        
        if allFieldsFilled {
            let alertController = UIAlertController(title: "Анкета отправлена", message: "Спасибо, что помогли обрести дом еще одному пушистику!🐶🐱", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Готово", style: .default) { _ in
                self.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            
            for questionnaireTextField in questionnaireTextFields {
                questionnaireTextField?.text = ""
            }
        } else {
            let alertController = UIAlertController(title: "Ой!", message: "Пожалуйста, заполните все поля в анкете.😿", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }
}

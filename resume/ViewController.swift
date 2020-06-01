//
//  ViewController.swift
//  resume
//
//  Created by Bober on 29/05/2020.
//  Copyright © 2020 AntonBu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var forgotUserNameBtn: UIButton!
    @IBOutlet weak var forgotPasswordBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func logInAction() {
        if let username = usernameTextField.text {
            if let password = passwordTextField.text {
                if username != account.usernamme || password != account.password {
                    toSwear()
                    return
                }
            }
        }
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    
    @IBAction func forgotButton(_ sender: UIButton) {
        let title = "Oops!"
        var message = ""
        switch sender.tag {
        case 1:
            message = "Your name is \(account.usernamme)😉"
        case 2:
            message = "Your password is \(account.password)😉"
        default:
            print("Что-то пошло не туда")
            return
        }
        showAlert(with: title, and: message)
    }
    
    @IBAction func unwindSegueToLogin( segue: UIStoryboardSegue) {
        let dvc = segue.destination as! ViewController
        dvc.usernameTextField.text = ""
        dvc.passwordTextField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabbarcontroller = segue.destination as! UITabBarController
        let destinationVC = tabbarcontroller.viewControllers?.first as! HelloViewController
        destinationVC.username = usernameTextField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 1 {
            if let username = usernameTextField.text  {
                if username != "" {
                    passwordTextField.becomeFirstResponder()
                } else {
                    showAlert(and: "Введите имя пользователя")
                }
            }
        }
        if textField.tag == 2 {
            logInAction()
        }
        return false
    }
    
    private func toSwear() {
        let title = "Invalid login or password"
        let message = "Please, enter correct login and password"
        showAlert(with: title, and: message)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

// MARK: - UIAlertController
extension ViewController {
    private func showAlert(with title: String = "Ooops!", and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


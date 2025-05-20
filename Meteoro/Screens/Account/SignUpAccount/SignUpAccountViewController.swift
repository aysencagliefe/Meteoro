//
//  SignUpAccountViewController.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 20.05.2025.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class SignUpAccountViewController: UIViewController {

    
    var tapGesture: UITapGestureRecognizer!

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var againPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.isEnabled = false
        view.addGestureRecognizer(tapGesture)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    @objc func keyboardWillShow() {
        tapGesture.isEnabled = true
    }
    @objc func keyboardWillHide() {
        tapGesture.isEnabled = false
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @IBAction func xDismissButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        firebaseAuth()
    }
        
    func firebaseAuth(){
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, error in
            if let error = error {
                self.showAlertMessage(
                    title: "Hata",
                    message: "Girdiğiniz bilgileri kontrol ediniz.")
            } else {
                self.showAlertMessage(
                    title: "Başarılı",
                    message: "Kayıt işleminiz Başarı ile gerçekleştirildi. Lütfen giriş yapınız.",
                    handler: { _ in self.dismiss(animated: true) }
                )
            }
        }
    }
    
    
    
    
}

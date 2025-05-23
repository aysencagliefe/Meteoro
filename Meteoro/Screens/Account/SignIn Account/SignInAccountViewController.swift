//
//  SignInAccountViewController.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 20.05.2025.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class SignInAccountViewController: UIViewController {

    
    var tapGesture: UITapGestureRecognizer!

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var eMailTextField: UITextField!
    
    
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

    @IBAction func xButtonDismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func signInButton(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: eMailTextField.text ?? "", password: passwordTextField.text ?? "") { authResult, error in
            if let error = error {
                self.showAlertMessage(
                    title: "Hata",
                    message: "Giriş bilgilerini kontrol ediniz.")
            } else {
                self.showAlertMessage(
                    title: "Başarılı",
                    message: "Giriş yapıldı.",
                    handler: { _ in self.dismiss(animated: true) }
                )
            }
        }
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        let signUpVC = SignUpAccountViewController(nibName: "SignUpAccountViewController", bundle: nil)
        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true, completion: nil)
    }
    
   

}

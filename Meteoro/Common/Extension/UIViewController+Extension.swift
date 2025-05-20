//
//  UIViewController+Extension.swift
//  Meteoro
//
//  Created by Ayşen Çağlı Efe on 20.05.2025.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlertMessage(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: handler))
        present(alert, animated: true, completion: nil)

    }


}

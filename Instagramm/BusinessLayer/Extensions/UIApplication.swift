//
//  UIApplication.swift
//  Instagramm
//
//  Created by Himanshu's MacBook on 08/06/24.
//

import UIKit

extension UIApplication {
    
    /// method to hide keyboard
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

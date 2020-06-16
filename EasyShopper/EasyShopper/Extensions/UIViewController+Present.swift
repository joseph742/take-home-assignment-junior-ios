//
//  UIViewController+Present.swift
//  EasyShopper
//
//  Created by Joseph Umoru on 13/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation
import UIKit

/*
 Description: Defines the showAlertView methods
 method1: showAlertView
         parameter1: title
         parameter2: messge
         parameter3: actions
 */

protocol ShowAlert {
  func showAlertView(with title: String, message: String, actions: [UIAlertAction]?)
}

/*
 Description: conforms to the ShowAlert protocol and adding functionality, so that all conforming types have access to the method
 */

extension ShowAlert where Self: UIViewController {
  func showAlertView(with title: String, message: String, actions: [UIAlertAction]? = nil) {
    guard presentedViewController == nil else {
      return
    }
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    actions?.forEach { action in
      alertController.addAction(action)
    }
    present(alertController, animated: true)
  }
}

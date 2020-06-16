//
//  XCUIApplication+Extensions.swift
//  EasyShopperUITests
//
//  Created by Joseph Umoru on 15/06/2020.
//  Copyright © 2020 Ka-ching. All rights reserved.
//

import Foundation
import XCTest

/*
 Description: Verify if the UI element with the identifier exists
 */

extension XCUIApplication {
    var isDisplayingOnboarding: Bool {
        return otherElements["onboardingView"].exists
    }
}

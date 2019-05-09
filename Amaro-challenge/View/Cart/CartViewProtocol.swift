//
//  CartViewProtocol.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/7/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import SwiftEntryKit
import UIKit

protocol CartViewProtocol {
    func showAlertMessage(message contentView : EKAlertMessageView, attributes : EKAttributes)
    func reloadTableview()
    func dismissAlert()
}

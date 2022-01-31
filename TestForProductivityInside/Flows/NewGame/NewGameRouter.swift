//
//  NewGameRouter.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 28.01.2022.
//

import Foundation
import UIKit

protocol NewGameRouter {
    func showRoundScreen()
}

final class NewGameRouterImp {
    weak var rootController: UIViewController?
}

extension NewGameRouterImp: NewGameRouter {
    func showRoundScreen() {
        let controler = RoundAssembly().assembly()
        controler.modalPresentationStyle = .fullScreen
        rootController?.present(controler, animated: false)
    }
}

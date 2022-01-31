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
        rootController?.dismiss(animated: true) { [weak self] in
            let controler = RoundAssembly().assembly()
            UIApplication.shared.windows.first?.rootViewController = controler
            controler.modalPresentationStyle = .fullScreen
            self?.rootController?.present(controler, animated: true)
        }
    }
}

//
//  RelultRouter.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 29.01.2022.
//

import Foundation
import UIKit

protocol ResultRouter {
    func showRoundScreen()
}

final class ResultRouterImp {
    weak var rootController: UIViewController?
}

extension ResultRouterImp: ResultRouter {
    func showRoundScreen() {
        rootController?.dismiss(animated: false) { [weak self] in
            let controler = RoundAssembly().assembly()
            UIApplication.shared.windows.first?.rootViewController = controler
            controler.modalPresentationStyle = .fullScreen
            self?.rootController?.present(controler, animated: false)
        }
    }
}

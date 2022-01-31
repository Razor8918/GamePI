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
        let controler = RoundAssembly().assembly()
        controler.modalPresentationStyle = .fullScreen
        rootController?.present(controler, animated: false)
    }
}

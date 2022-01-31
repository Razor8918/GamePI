//
//  HumanGuessRouter.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 29.01.2022.
//

import Foundation
import UIKit

protocol HumanGuessRouter {
    func showComputerGuessScreen(value: Int, roundNumber: Int)
    func showSuccessScreen()
}

final class HumanGuessRouterImp {
    weak var rootController: UIViewController?
}

extension HumanGuessRouterImp: HumanGuessRouter {
    func showComputerGuessScreen(value: Int, roundNumber: Int) {
        rootController?.dismiss(animated: false) { [weak self] in
            let controler = ComputerGuessAssembly().assembly(with: .init(value: value, roundNumber: roundNumber))
            UIApplication.shared.windows.first?.rootViewController = controler
            controler.modalPresentationStyle = .fullScreen
            self?.rootController?.present(controler, animated: false)
        }
    }
    
    func showSuccessScreen() {
        rootController?.dismiss(animated: false) { [weak self] in
            let controler = ResultAssembly().assembly(with: .init(hasGameWon: true))
            UIApplication.shared.windows.first?.rootViewController = controler
            controler.modalPresentationStyle = .fullScreen
            self?.rootController?.present(controler, animated: false)
        }
    }
}

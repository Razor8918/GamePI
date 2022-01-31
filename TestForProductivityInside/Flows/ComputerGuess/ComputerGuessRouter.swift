//
//  ComputerGuessRouter.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 29.01.2022.
//

import Foundation
import UIKit

protocol ComputerGuessRouter {
    func showHumanGuessScreen(value: Int, roundNumber: Int)
    func showFailureScreen()
}

final class ComputerGuessRouterImp {
    weak var rootController: UIViewController?
}

extension ComputerGuessRouterImp: ComputerGuessRouter {
    func showHumanGuessScreen(value: Int, roundNumber: Int) {
        rootController?.dismiss(animated: false) { [weak self] in
            let controler = HumanGuessAssembly().assembly(with: .init(value: value, roundNumber: roundNumber))
            UIApplication.shared.windows.first?.rootViewController = controler
            controler.modalPresentationStyle = .fullScreen
            self?.rootController?.present(controler, animated: false)
        }
    }
    
    func showFailureScreen() {
        rootController?.dismiss(animated: false) { [weak self] in
            let controler = ResultAssembly().assembly(with: .init(hasGameWon: false))
            UIApplication.shared.windows.first?.rootViewController = controler
            controler.modalPresentationStyle = .fullScreen
            self?.rootController?.present(controler, animated: false)
        }
    }
}

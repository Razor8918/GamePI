//
//  ComputerGuessRouter.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 29.01.2022.
//

import Foundation
import UIKit

protocol ComputerGuessRouter {
    func showHumanGuessScreen(value: Int)
    func showFailureScreen()
}

final class ComputerGuessRouterImp {
    weak var rootController: UIViewController?
}

extension ComputerGuessRouterImp: ComputerGuessRouter {
    func showHumanGuessScreen(value: Int) {
        let controler = HumanGuessAssembly().assembly(with: .init(value: value))
        controler.modalPresentationStyle = .fullScreen
        rootController?.present(controler, animated: false)
    }
    
    func showFailureScreen() {
        let controler = ResultAssembly().assembly(with: .init(hasGameWon: false))
        controler.modalPresentationStyle = .fullScreen
        rootController?.present(controler, animated: false)
    }
}

//
//  HumanGuessRouter.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 29.01.2022.
//

import Foundation
import UIKit

protocol HumanGuessRouter {
    func showComputerGuessScreen(value: Int)
    func showSuccessScreen()
}

final class HumanGuessRouterImp {
    weak var rootController: UIViewController?
}

extension HumanGuessRouterImp: HumanGuessRouter {
    func showComputerGuessScreen(value: Int) {
        let controler = ComputerGuessAssembly().assembly(with: .init(value: value))
        controler.modalPresentationStyle = .fullScreen
        rootController?.present(controler, animated: false)
    }
    
    func showSuccessScreen() {
        let controler = ResultAssembly().assembly(with: .init(hasGameWon: true))
        controler.modalPresentationStyle = .fullScreen
        rootController?.present(controler, animated: false)
    }
}

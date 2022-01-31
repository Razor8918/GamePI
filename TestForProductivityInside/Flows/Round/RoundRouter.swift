//
//  RoundRouter.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 28.01.2022.
//

import Foundation
import UIKit

protocol RoundRouter {
    func showComputerGuessScreen(value: Int, roundNumber: Int)
}

final class RoundRouterImp {
    weak var rootController: UIViewController?
}

extension RoundRouterImp: RoundRouter {
    func showComputerGuessScreen(value: Int, roundNumber: Int) {
        rootController?.dismiss(animated: true) { [weak self] in
            let controler = ComputerGuessAssembly().assembly(with: .init(value: value, roundNumber: 1))
            UIApplication.shared.windows.first?.rootViewController = controler
            controler.modalPresentationStyle = .fullScreen
            self?.rootController?.present(controler, animated: true)
        }
    }
}

//
//  RoundRouter.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 28.01.2022.
//

import Foundation
import UIKit

protocol RoundRouter {
    func showComputerGuessScreen(value: Int)
}

final class RoundRouterImp {
    weak var rootController: UIViewController?
}

extension RoundRouterImp: RoundRouter {
    func showComputerGuessScreen(value: Int) {
        let controler = ComputerGuessAssembly().assembly(with: .init(value: value))
        controler.modalPresentationStyle = .fullScreen
        rootController?.present(controler, animated: false)
    }
}

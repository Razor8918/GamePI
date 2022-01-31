//
//  RoundPresenter.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 28.01.2022.
//

import Foundation

protocol RoundPresenter {
    func showComputerGuessScreen(value: Int)
}

final class RoundPresenterImp {
    
    weak var view: RoundView?
    
    // MARK: - Private Properies
    
    private let router: RoundRouter
    
    // MARK: - Initialization
    
    init(router: RoundRouter) {
        self.router = router
    }
}

extension RoundPresenterImp: RoundPresenter {
    func showComputerGuessScreen(value: Int) {
        router.showComputerGuessScreen(value: value, roundNumber: 1)
    }
}

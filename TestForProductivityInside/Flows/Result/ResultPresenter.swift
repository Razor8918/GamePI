//
//  ResultPresenter.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 29.01.2022.
//

import Foundation

protocol ResultPresenter {
    func getResultText() -> String
    func startNewGame()
}

final class ResultPresenterImp {
    
    weak var view: ResultView?
    
    // MARK: - Private Properies
    
    private var hasGameWon: Bool
    
    private let router: ResultRouter
    
    // MARK: - Initialization
    
    init(hasGameWon: Bool, router: ResultRouter) {
        self.hasGameWon = hasGameWon
        self.router = router
    }
    
}

extension ResultPresenterImp: ResultPresenter {
    func getResultText() -> String {
        let winText = "You Win"
        let loseText = "You Lose"
        return hasGameWon ? winText : loseText
    }
    
    func startNewGame() {
        router.showRoundScreen()
    }
}

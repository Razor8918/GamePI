//
//  NewGamePresenter.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 28.01.2022.
//

import Foundation

protocol NewGamePresenter {
   func startNewGame()
}

final class NewGamePresenterImp {
    
    weak var view: NewGameView?
    
    // MARK: - Private Properies
    
    private let router: NewGameRouter
    
    // MARK: - Initialization
    
    init(router: NewGameRouter) {
        self.router = router
    }
    
}

extension NewGamePresenterImp: NewGamePresenter {
    func startNewGame() {
        router.showRoundScreen()
    }
}

//
//  ComputerGuessPresenter.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 28.01.2022.
//

import Foundation

enum ActionType {
    case less
    case equal
    case greater
}

protocol ComputerGuessPresenter {
    func getGuessedValue() -> Int
    func tappedActionButton(actionType: ActionType)
}

final class ComputerGuessPresenterImp {
    weak var view: ComputerGuessView?
    
    // MARK: - Private Properies
    
    private let value: Int
    
    private let router: ComputerGuessRouter
    
    // MARK: - Initialization
    
    init(value: Int, router: ComputerGuessRouter) {
        self.value = value
        self.router = router
    }
}

extension ComputerGuessPresenterImp: ComputerGuessPresenter {
    func getGuessedValue() -> Int {
        return Int.random(in: 1..<99)
    }
    
    func tappedActionButton(actionType: ActionType) {
        switch actionType {
        case .less, .greater:
            router.showHumanGuessScreen(value: value)
        case .equal:
            router.showFailureScreen()
        }
    }
    
}

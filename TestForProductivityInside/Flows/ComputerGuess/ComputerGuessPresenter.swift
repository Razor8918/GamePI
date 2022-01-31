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
    func getRoundText() -> String
}

final class ComputerGuessPresenterImp {
    weak var view: ComputerGuessView?
    
    // MARK: - Private Properies
    
    private let value: Int
    
    private let router: ComputerGuessRouter
    
    private let roundNumber: Int
    
    // MARK: - Initialization
    
    init(value: Int, router: ComputerGuessRouter, roundNumber: Int) {
        self.value = value
        self.router = router
        self.roundNumber = roundNumber
    }
}

extension ComputerGuessPresenterImp: ComputerGuessPresenter {
    func getGuessedValue() -> Int {
        return Int.random(in: 1..<99)
    }
    
    func tappedActionButton(actionType: ActionType) {
        switch actionType {
        case .less, .greater:
            let nextRoundNumber = roundNumber + 1
            router.showHumanGuessScreen(value: value, roundNumber: nextRoundNumber)
        case .equal:
            router.showFailureScreen()
        }
    }
    
    func getRoundText() -> String {
        return "Round № " + roundNumber.description
    }
}

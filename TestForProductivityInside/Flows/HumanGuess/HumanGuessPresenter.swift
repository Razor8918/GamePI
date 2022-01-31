//
//  HumanGuessPresenter.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 29.01.2022.
//

import Foundation

protocol HumanGuessPresenter {
    func getValue() -> Int
    func setValue(guessValue: Int)
    func touchBottomButton()
    func getRoundText() -> String
}

final class HumanGuessPresenterImp {
    weak var view: HumanGuessView?
    
    // MARK: - Private Properies
    
    /// Число, которое нужно угадать
    private let value: Int
    private let router: HumanGuessRouter
    private let roundNumber: Int
    
    private var guessValue: Int?
    
    // MARK: - Initialization
    
    init(value: Int, router: HumanGuessRouter, roundNumber: Int) {
        self.value = value
        self.router = router
        self.roundNumber = roundNumber
    }
}

extension HumanGuessPresenterImp: HumanGuessPresenter {
    func getValue() -> Int {
        return value
    }
    
    func setValue(guessValue: Int) {
        self.guessValue = guessValue
    }
    
    func touchBottomButton() {
        guard let guessValue = guessValue else { return }
        
        if value == guessValue {
            router.showSuccessScreen()
        } else {
            let nextRoundNumber = roundNumber + 1
            router.showComputerGuessScreen(value: value, roundNumber: nextRoundNumber)
        }
    }
    
    func getRoundText() -> String {
        return "Round № " + roundNumber.description
    }
}

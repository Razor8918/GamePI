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
}

final class HumanGuessPresenterImp {
    weak var view: HumanGuessView?
    
    // MARK: - Private Properies
    
    /// Число, которое нужно угадать
    private let value: Int
    private let router: HumanGuessRouter
    
    private var guessValue: Int?
    
    // MARK: - Initialization
    
    init(value: Int, router: HumanGuessRouter) {
        self.value = value
        self.router = router
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
            router.showComputerGuessScreen(value: value)
        }
    }
}

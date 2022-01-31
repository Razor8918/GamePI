//
//  ComputerGuessAssembly.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 28.01.2022.
//

final class ComputerGuessAssembly {
    func assembly(with context: Context) -> ComputerGuessViewController {
        let controller = ComputerGuessViewController()
        let router = ComputerGuessRouterImp()
        let presenter = ComputerGuessPresenterImp(value: context.value, router: router, roundNumber: context.roundNumber)
        
        controller.presenter = presenter
        presenter.view = controller
        router.rootController = controller
        
        return controller
    }
}

extension ComputerGuessAssembly {
    struct Context {
        let value: Int
        let roundNumber: Int
    }
}

//
//  HumanGuessAssembly.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 29.01.2022.
//

final class HumanGuessAssembly {
    func assembly(with context: Context) -> HumanGuessViewController {
        let controller = HumanGuessViewController()
        let router = HumanGuessRouterImp()
        let presenter = HumanGuessPresenterImp(value: context.value, router: router)
        
        controller.presenter = presenter
        presenter.view = controller
        router.rootController = controller
        
        return controller
    }
}

extension HumanGuessAssembly {
    struct Context {
        let value: Int
    }
}


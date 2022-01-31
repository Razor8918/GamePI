//
//  ResultAssembly.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 29.01.2022.
//

final class ResultAssembly {
    func assembly(with context: Context) -> ResultViewController {
        let controller = ResultViewController()
        let router = ResultRouterImp()
        let presenter = ResultPresenterImp(hasGameWon: context.hasGameWon, router: router)
        
        controller.presenter = presenter
        presenter.view = controller
        router.rootController = controller
        
        return controller
    }
}

extension ResultAssembly {
    struct Context {
        let hasGameWon: Bool
    }
}

//
//  RoundAssembly.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 28.01.2022.
//

final class RoundAssembly {
    func assembly() -> RoundViewController {
        let controller = RoundViewController()
        let router = RoundRouterImp()
        let presenter = RoundPresenterImp(router: router)
        
        controller.presenter = presenter
        presenter.view = controller
        router.rootController = controller
        
        return controller
    }
}

//
//  NewGameAssembly.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 28.01.2022.
//


final class NewGameAssembly {
    func assembly() -> NewGameViewController {
        let controller = NewGameViewController()
        let router = NewGameRouterImp()
        let presenter = NewGamePresenterImp(router: router)
        
        controller.presenter = presenter
        presenter.view = controller
        router.rootController = controller
        
        return controller
    }
    
}

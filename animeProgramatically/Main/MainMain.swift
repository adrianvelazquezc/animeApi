//
//  MainMain.swift
//  animeProgramatically
//
//  Created by Mac on 27/01/22.
//

import Foundation
import UIKit

open class MainMain{
    public static func createModule(navigation: UINavigationController) -> UIViewController {
        let viewController: MainView? = MainView()
        if let view = viewController {
            let presenter = MainPresenter()
            let router = MainRouter()
            let interactor = MainInteractor()
            
            
            
            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            
            router.navigation = navigation
            
            interactor.presenter = presenter
            return view
        }
        return UIViewController()
    }
}


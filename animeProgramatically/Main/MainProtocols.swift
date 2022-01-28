//
//  MainProtocols.swift
//  animeProgramatically
//
//  Created by Mac on 27/01/22.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    
}

protocol MainInteractorProtocol: AnyObject {
    
}

protocol MainPresenterProtocol: AnyObject {
    func requestRegisterForm(delegate: OptionChoosenProtocol)
}

protocol MainRouterProtocol: AnyObject {
    func navigateRegisterForm(delegate: OptionChoosenProtocol)
}

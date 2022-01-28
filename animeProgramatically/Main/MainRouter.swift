//
//  MainRouter.swift
//  animeProgramatically
//
//  Created by Mac on 27/01/22.
//

import Foundation
import UIKit

class MainRouter{
    var navigation: UINavigationController?
}

extension MainRouter: MainRouterProtocol{
    func navigateRegisterForm(delegate: OptionChoosenProtocol) {
        print("1111111")
        print(delegate)
        
    }
        
    
}

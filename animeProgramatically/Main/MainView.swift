//
//  MainView.swift
//  animeProgramatically
//
//  Created by Mac on 27/01/22.
//

import Foundation
import UIKit

class MainView: UIViewController {
    var presenter: MainPresenterProtocol?
    private var ui: MainViewUI?
    internal var delegate: OptionChoosenProtocol?
    
    override func loadView() {
        ui = MainViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        self.presenter?.requestRegisterForm(delegate: self)
        view = ui
    }
}

extension MainView: MainViewProtocol {
    
}

extension MainView: MainViewUIDelegate {
    
}
extension MainView: OptionChoosenProtocol {
    func didChoiceOption(_ gender: String) {
        print("aaaa")
    }
}

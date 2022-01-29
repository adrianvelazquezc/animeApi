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
        view = ui
    }
    
    override func viewDidLoad() {
        self.presenter?.requestListUrl(endPoint: "neko")
    }
}

extension MainView: MainViewProtocol {
    func notifyListUrl(urlList: String) {
        if let url = URL(string: "\(urlList)"){
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.ui?.animeImage.image = UIImage(data: data)
                }
            }
        }
    }
    
    
}

extension MainView: MainViewUIDelegate {
    func notifyOptionChosed(endPoint: String) {
        self.presenter?.requestListUrl(endPoint: endPoint)
    }
    
    
}

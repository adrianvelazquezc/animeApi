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
//        self.presenter?.requestListUrl(endPoint: "sfw/neko")
        self.ui?.activityIndicator.stopAnimating()
        navigationController?.isNavigationBarHidden = true
    }
}

extension MainView: MainViewProtocol {
    func notifyListUrl(urlList: String) {
        if let url = URL(string: "\(urlList)"){
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self.ui?.animeImage.image = image
//                    self.ui?.activityIndicator.stopAnimating()
                    self.ui?.animeImage.isHidden = false
                    self.ui?.animationView.isHidden = true
                    self.ui?.loadinLabel.isHidden = true
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

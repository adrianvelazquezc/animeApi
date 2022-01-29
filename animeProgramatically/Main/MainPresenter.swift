//
//  MainPresenter.swift
//  animeProgramatically
//
//  Created by Mac on 27/01/22.
//

import Foundation

class MainPresenter {
    var interactor: MainInteractorProtocol?
    weak var view: MainViewProtocol?
    var router: MainRouterProtocol?
}



extension MainPresenter: MainPresenterProtocol {
    func requestListUrl() {
        self.interactor?.getListUrl()
    }
    
    func responseListUrl(urlListResponse: String) {
        self.view?.notifyListUrl(urlList: urlListResponse)
    }
    
    
    
}

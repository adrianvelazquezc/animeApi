//
//  MainProtocols.swift
//  animeProgramatically
//
//  Created by Mac on 27/01/22.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func notifyListUrl(urlList: String)
}

protocol MainInteractorProtocol: AnyObject {
    func getListUrl(endPoint: String)
}

protocol MainPresenterProtocol: AnyObject {
    func requestListUrl(endPoint: String)
    func responseListUrl(urlListResponse: String)
}

protocol MainRouterProtocol: AnyObject {
}

//
//  MainInteractor.swift
//  animeProgramatically
//
//  Created by Mac on 27/01/22.
//

import Foundation

class MainInteractor{
    var presenter: MainPresenterProtocol?
}

extension MainInteractor: MainInteractorProtocol {
    
    func getListUrl(endPoint: String){
        getUrl(endPoint: endPoint) { responseInfo, responseCode, responseError in
            guard let response = responseInfo?.url else {
                guard let error = responseError else {
                    return
                }
                return
            }
            self.presenter?.responseListUrl(urlListResponse: response)
        }
    }
    
    func getUrl(endPoint: String, completionHandler:@escaping(PicturesDetailResponse?,Int?,Error?)->Void){
            let urlString = "https://api.waifu.pics/sfw/\(endPoint)"
            if let urlObject = URL(string: urlString){
                var urlRequest = URLRequest(url: urlObject)
                urlRequest.httpMethod = "GET"
                
                let task = URLSession.shared.dataTask(with: urlRequest) { responseData, responseCode, responseError in
                    if let auxResponse = responseCode as? HTTPURLResponse {
                        let auxResponseCode = auxResponse.statusCode
                    }
                    guard let respuestaDiferente = responseData else {
                        completionHandler(nil, responseCode.hashValue, responseError)
                        return
                    }
                    if let json = try? JSONDecoder().decode(PicturesDetailResponse.self, from: respuestaDiferente){
                        completionHandler(json,200,nil)
                    }
                    
                    
                }
                task.resume()
            }
    }
}

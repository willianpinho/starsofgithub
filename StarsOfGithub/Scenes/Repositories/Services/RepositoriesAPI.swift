//
//  RepositoriesAPI.swift
//  StarsOfGithub
//
//  Created by Willian Pinho on 21/11/19.
//  Copyright (c) 2019 Willian Pinho. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import SwiftyJSON

class RepositoriesAPI: RepositoriesStoreProtocol {
    var repositories: [Repository] = []
    
    func fetchRepositories(completionHandler: @escaping ([Repository], RepositoriesError?) -> Void) {
    }
    
    func fetchRepositories(completionHandler: @escaping RepositoriesStoreFetchRepositoriesCompletionHandler) {
    }
    
    func fetchRepositories(completionHandler: @escaping ([Repository]) -> Void) {
        guard let url = URL(string: "https://api.github.com/search/repositories?q=language:swift&sort=stars&page=1&per_page=30") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    completionHandler(self.repositories)
                    return }
            do{
                let json = try JSON(data: dataResponse)
                let items =  json["items"].arrayValue.map {$0}
                for i in items {
                    let repository = try Repository(json: i)
                    self.repositories.append(repository!)
                }
                completionHandler(self.repositories)
            } catch let parsingError {
                completionHandler(self.repositories)
            }
        }
        task.resume()
    }
    
    
    
}

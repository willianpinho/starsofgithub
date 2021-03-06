//
//  RepositoriesMemoryAPI.swift
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

class RepositoriesMemoryAPI: RepositoriesStoreProtocol {
   var objects = [
       Repository(fullName: "willianpinho/starsofgithub", htmlUrl: "https://github.com/willianpinho/starsofgithub", stargazersCount: 0, owner: Owner(login: "willianpinho", avatarUrl: "https://avatars3.githubusercontent.com/u/1058177?s=460&v=4"))

   ]
    
    func fetchRepositories(completionHandler: @escaping ([Repository], RepositoriesError?) -> Void) {
        
    }
    
    func fetchRepositories(completionHandler: @escaping RepositoriesStoreFetchRepositoriesCompletionHandler) {
        
    }
    
    func fetchRepositories(completionHandler: @escaping ([Repository]) -> Void)
    {
        completionHandler(self.objects)
    }
    
}

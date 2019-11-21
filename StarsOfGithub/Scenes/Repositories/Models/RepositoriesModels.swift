//
//  RepositoriesModels.swift
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

struct SomeSDKObject: Codable {
    var title: String
    var subtitle: String
}

enum Repositories {
    
    enum Fetch {
        struct Request {
        }
        struct Response {
            var someSDKObject: [SomeSDKObject]
        }
        struct ViewModel {
            struct DisplaySomething {
                var title: String
                var subtitle: String
            }
            var displaySomething: [DisplaySomething]
        }
    }
    
}
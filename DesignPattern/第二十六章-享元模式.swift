//
//  第二十六章-享元模式.swift
//  DesignPattern
//
//  Created by Johnson on 16/3/1.
//  Copyright © 2016年 Johnson. All rights reserved.
//

/*
享元模式: 运用共享技术实现大量的细粒度的对象   可以理解为iOS TableView的Cell共享
*/

import Foundation


class User {
    var name: String?
    init(tName: String) {
        name = tName
    }
}


class WebSite {
    var name: String?
    init(tName: String) {
        name = tName
    }
    func operation(user: User) {}
}

class ConcreteWebSite: WebSite {
    
    
    override func operation(user: User) {
        NSLog("享元模式-> 网站分类: \(name!), 用户为: \(user.name!)")
    }
}


class WebSiteFactory {
    lazy var dict: [String: WebSite] = [:]
    
    func getWebSiteCategory(key: String) -> WebSite {
        if dict[key] == nil {
            dict[key] = ConcreteWebSite(tName: key)
        }
        return dict[key]!
    }
}


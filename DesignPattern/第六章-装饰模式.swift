//
//  第六章-装饰模式.swift
//  DesignPattern
//
//  Created by Johnson on 16/2/17.
//  Copyright © 2016年 Johnson. All rights reserved.
//


/*
装饰模式: 动态的给一个对象添加一些额外的职责, 就增加功能来说, 装饰模式比生成子类更为灵活, 个人理解类似objective-c的Category  PS: 参照main.swift中示例代码来理解装饰模式(Important)   游戏里面角色着装的常用设计模式
*/

import Foundation


class Person {
    var name: String?
    func show() {}
}


class Finery: Person {
    var component: Person?
    
    func decorate(person: Person) {
        component = person
    }
    
    override func show() {
        component?.show()
    }
}


class Tshirts: Finery {
    override func show() {
        NSLog("装饰模式-> T恤")
    }
}

class BigThrouser: Finery {
    override func show() {
        NSLog("装饰模式-> 跨裤")
    }
}

class Suit: Finery {
    override func show() {
        NSLog("装饰模式-> 西装")
    }
}

class Underpants: Finery {
    override func show() {
        NSLog("装饰模式-> 内裤")
    }
}
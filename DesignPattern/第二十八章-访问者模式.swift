//
//  第二十八章-访问者模式.swift
//  DesignPattern
//
//  Created by Johnson on 16/3/1.
//  Copyright © 2016年 Johnson. All rights reserved.
//

/*
访问者模式: 表示一个作用于某对象结构中的各元素的操作. 它使你可以在不改变各元素的类的前提下定义作用于这些元素的操作. 比较男女在对待不同事物的区别, 因为男女是固定的, 所以只需要遍历他们对待不同的事情即可
结构图: "第二十八章-访问者模式.png"
*/

import Foundation


//具体对象
class Person_Super {
    var personType: String?
    func accept(action: Action) {}
}

class Man: Person_Super {
    override func accept(action: Action) {
        personType = "男人"
        action.getManConclusion(self)
    }
}

class WoMan: Person_Super {
    override func accept(action: Action) {
        personType = "女人"
        action.getWoManConclusion(self)
    }
}



//对象反应
class Action {
    func getManConclusion(person: Person_Super) {}
    func getWoManConclusion(person: Person_Super) {}
}

class Success: Action {
    override func getManConclusion(person: Person_Super) {
        NSLog("访问者模式-> \(person.personType) 背后多半有一个伟大的女人")
    }
    override func getWoManConclusion(person: Person_Super) {
        NSLog("访问者模式-> \(person.personType) 背后大多有一个不成功的男人")
    }
}

class Failed: Action {
    override func getManConclusion(person: Person_Super) {
        NSLog("访问者模式-> \(person.personType) 闷头喝酒, 谁也不用劝")
    }
    override func getWoManConclusion(person: Person_Super) {
        NSLog("访问者模式-> \(person.personType) 眼泪汪汪, 谁也劝不了")
    }
}


//枚举器
class ObjectStruture {
    var list: [Person_Super] = []
    
    func attach(person: Person_Super) {
        list.append(person)
    }
    
    func remove(person: Person_Super) {
        
        var index = 0
        for p in list {
            if p === person {
                list.removeAtIndex(index)
            }
            index++
        }
    }
    
    func display(action: Action) {
        for p in list {
            p.accept(action)
        }
    }
}



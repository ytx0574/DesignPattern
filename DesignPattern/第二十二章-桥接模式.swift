//
//  第二十二章-桥接模式.swift
//  DesignPattern
//
//  Created by Johnson on 16/2/29.
//  Copyright © 2016年 Johnson. All rights reserved.
//

/*
桥接模式: 将抽象部分与实现部分分离, 使他们都可以独立的变化.  例如不同的手机和不同的软件相互兼容, 就是最明显的桥接模式. 保证了软件跟硬件的随意组合
*/

import Foundation


//实现者 (软件)
class Implementor {
    func operation() {}
}


class ConcreteImplementorA: Implementor {
    override func operation() {
        NSLog("桥接模式-> 具体实现者A的操作");
    }
}

class ConcreteImplementorB: Implementor {
    override func operation() {
        NSLog("桥接模式-> 具体实现者B的操作")
    }
}


//抽象 (手机)
class Abstraction {
    var implementor: Implementor?
    
    func setImplementor(tImplementor: Implementor) {
        implementor = tImplementor
    }
    
    func operation() {
        implementor?.operation()
    }
}


class RefineAbstraction: Abstraction {
    override func operation() {
        implementor?.operation()
    }
}


//
//  第十三章-建造者模式.swift
//  DesignPattern
//
//  Created by Johnson on 16/2/23.
//  Copyright © 2016年 Johnson. All rights reserved.
//


/*
建造者模式: 主要用于创建复杂的对象, 这些对象的内部构造顺序通常是稳定的 但对象内部的构建通常面临着复杂的变化, 通常游戏的设计大多采用建造者模式
    好处: 使得构造与展示分离, 因为隐藏了产品的内部组装 所以若需要改变一个内部展示, 只只需要再定义一个具体的建造者就可以了
*/

import Foundation


class Product {
    
    var list: [String] = []
    
    func add(part: String) {
        list.append(part)
    }
    
    func show() {
        NSLog("建造者模式-> 展示产品")
    }
}

//抽象建造者类
protocol Builder {
    func buildA()
    func buildB()
    func getResult() -> Product
}

//建造者A
class ConcreteBuildA: Builder {
    
    lazy var product: Product = Product()
    func buildA() {
        NSLog("建造者模式-> 建造者A  添加部件A")
    }
    
    func buildB() {
        NSLog("建造者模式-> 建造者A  添加部件B")
    }
    
    func getResult() -> Product {
        return product
    }
}

//建造者B
class ConcreteBuildB: Builder {
    lazy var product: Product = Product()
    
    func buildA() {
        NSLog("建造者模式-> 建造者B  添加部件A")
    }
    
    func buildB() {
        NSLog("建造者模式-> 建造者B  添加部件B")
    }
    
    func getResult() -> Product {
        return product
    }
}


//指挥者（导演）
class Director {
    func construct(builder: Builder) {
        builder.buildA()
        builder.buildB()
    }
}
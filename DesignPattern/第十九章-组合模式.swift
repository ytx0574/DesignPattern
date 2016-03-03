//
//  第十九章-组合模式.swift
//  DesignPattern
//
//  Created by Johnson on 16/2/25.
//  Copyright © 2016年 Johnson. All rights reserved.
//

/*
组合模式: 将对象合成树形结构以表示 '部分 整体' 的层次结构. 组合模式使得用户对单个对象和组合对象的使用具有一致性.  (通常用来做树形结构, 可以不断的递归下去, 这个树也就越来越大), 组合模式引申出 透明模式与安全模式, 详细参见 "第十九章-透明模式与安全模式.png"
何时使用: 当需求中是体现部分与整体层次的结构时, 以及你希望用户可以忽略组合对象与单个对象的不同, 统一的使用组合结构中的所有对象时, 就应该考虑组合模式了.
*/

import Foundation


class Company {
    var name: String
    init(tname: String) {
        name = tname
    }
    
    func add(c: Company) {}
    func remove(c: Company) {}
    func display() {}
    func lineOfDuty() {} //履行职责
}


//树枝节点
class ConcreteCompany: Company {
    var list: [Company] = []
    
    override func add(c: Company) {
        list.append(c)
    }
    
    override func remove(c: Company) {
        for (var j: Int = 0; j < list.count; j++) {
            
            if list[j].name == c.name {
                list.removeAtIndex(j)
            }
        }
    }
    
    override func display() {
        
        var string: String = ""
        for c: Company in list {
            c.display()
            string.appendContentsOf("-")
        }
        NSLog("\(string)  \(name)")
    }
    
    override func lineOfDuty() {
        for c: Company in list {
            c.lineOfDuty()
        }
    }
    
}

//树叶节点  人力资源部
class HRRepartment: Company {
    override func add(c: Company) {
        NSLog("组合模式-> 添加Company 人力资源部\(c)")
    }
    override func remove(c: Company) {
        NSLog("组合模式-> 移除Company 人力资源部\(c)")
    }
    override func display() {
        NSLog("组合模式-> 显示Company 人力资源部")
    }
    override func lineOfDuty() {
        NSLog("组合模式-> 履行职责Company 员工招聘培训管理")
    }
}


//树叶节点 财务部
class FinanceDepartment: Company {
    override func add(c: Company) {
        NSLog("组合模式-> 添加Company 财务部\(c)")
    }
    override func remove(c: Company) {
        NSLog("组合模式-> 移除Company 财务部\(c)")
    }
    override func display() {
        NSLog("组合模式-> 显示Company 财务部")
    }
    override func lineOfDuty() {
        NSLog("组合模式-> 履行职责Company 财务收支管理")
    }
}
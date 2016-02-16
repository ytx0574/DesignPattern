//
//  第一章-简单的工厂模式.swift
//  DesignPattern
//
//  Created by Johnson on 16/2/15.
//  Copyright © 2016年 Johnson. All rights reserved.
//


/*
面向对象: "灵活 易修改 可复用, 业务封装合理, 避免代码耦合"
    1. 可维护;  改很快
    2. 可复用;  重复使用
    3. 可扩展;  迭代增加方便
    4. 灵活性好.  类似活字印刷, 排版 横竖 都可以
*/


import Foundation


//操作类
class Operation {
    
    var numberA = 0.0
    var numberB = 0.0
    
    func getResult() -> Double
    {
        return 0.0
    }
}


//算法类
class OperationAdd: Operation {
    override func  getResult() -> Double {
        return numberA + numberB
    }
}

class OperationSub: Operation {
    override func getResult() -> Double {
        return numberA - numberB
    }
}

class OperationMul: Operation {
    override func getResult() -> Double {
        return numberA * numberB
    }
}

class OperationDiv: Operation {
    override func getResult() -> Double {
        return numberA / numberB
    }
}

var xx = OperationAdd()


//工厂
class Factory {
    
    static var oper: Operation?
    
    static func createOperate(oprate: String) -> Operation {
        switch (oprate)
        {
            case "+":
                oper = OperationAdd()
                break
            case "-":
                oper = OperationSub()
                break
            case "*":
                oper = OperationMul()
                break
            case "/":
                oper = OperationDiv()
                break
            default:
                oper = nil
                NSLog("操作符写错了")
        }
        
        return oper!
    }
}

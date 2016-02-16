//
//  第二章-策略模式.swift
//  DesignPattern
//
//  Created by Johnson on 16/2/15.
//  Copyright © 2016年 Johnson. All rights reserved.
//


/*
策略模式: "用于定义一系列算法, 所有的算法都完成的同一个工作, 只是实现不同 (例如: 超市直接打折, 返利等算法, 仅调用一个方法, 根据里面不同的算法得到不同的结果(价格))"
    1. 虽然调用的方法相同, 但是内部的实现不同, 大大减少了算法直接的耦合
    2. 策略模式的Strategy类层为Context定义了一系列的可供重用的算法, 继承有助于析取这些算法的公共功能
    3. 每个算法都有自己的类, 简化了单元测试
*/


import Foundation

class CashSuper {
    func acceptCash(money: Double) -> Double {
        return 0.0
    }
}



class CashNormal: CashSuper {
    override func acceptCash(money: Double) -> Double {
        return money
    }
}

class CashRebate: CashSuper {
    
    var moneyRebate: Double?
    init(moneyRebateString: String)
    {
        moneyRebate = Double(moneyRebateString)
    }
    
    override func acceptCash(money: Double) -> Double {
        return money * (moneyRebate ?? 0.0)  // ?? 空合运算符
    }
}

class CashReturn: CashSuper {
    
    var moneyCondition: Double = 0.0
    var moneyReturn: Double = 0.0
    
    init(moneyCodintionString: String, moneyReturnString: String) {
        moneyCondition = Double(moneyCodintionString) ?? 0.0
        moneyReturn = Double(moneyReturnString) ?? 0.0
    }
    
    override func acceptCash(money: Double) -> Double {
        if money >= moneyReturn {
            return money - money / moneyCondition * moneyReturn
        }
        
        return money
    }
}



class CashContext {
    var cs: CashSuper?
    func cashContext(type: String) {
        switch(type) {
            case "正常收费":
                cs = CashNormal()
            break
            
            case "满300返100":
                cs = CashReturn(moneyCodintionString: "300", moneyReturnString: "100")
            break
            
            case "打 8 折":
                cs = CashRebate(moneyRebateString: "0.8")
            break
            
            default:
                cs = nil
        }
    }
    
    func getResult(money: Double) -> Double {
        return (cs?.acceptCash(money))!
    }
}


//
//  main.swift
//  DesignPattern
//
//  Created by Johnson on 16/2/16.
//  Copyright © 2016年 Johnson. All rights reserved.
//

import Foundation

print("Hello, World!")





//工厂模式
let operation: Operation = Factory.createOperate("*")
operation.numberA = 11
operation.numberB = 11
NSLog("工厂模式-> operation result: %.2f", operation.getResult())


//策略模式   与上面的工厂模式的好处在于, 只要知道Context并知道优惠方式即可, 而工厂模式既要知道工厂(Factory)又要知道模型(Operate)
let cashContext: CashContext = CashContext()
cashContext.cashContext("打 8 折")
NSLog("策略模式-> 计算价格: %.2f", cashContext.getResult(200))

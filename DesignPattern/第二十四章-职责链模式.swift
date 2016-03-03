//
//  第二十四章-职责链模式.swift
//  DesignPattern
//
//  Created by Johnson on 16/2/29.
//  Copyright © 2016年 Johnson. All rights reserved.
//

/*
职责链模式: 使多个对象都有机会处理请求, 从而避免请求的发送者和接收者之间的耦合关系.  将这个对象连成一条链, 并沿着这条链传递请求, 直到有一个对象处理它为止.  员工请假审批流程
好处: 
    1. 当发起请求时, 请求沿着链传递直到有一个handler对象处理它
    2. 接收者和发送者都没有对方的明确信息, 且链中对象自己也不知道链的结构, 可简化对象的相互连接
    3. 可随时增加或修改处理一个请求的结构, 增强了给对象指派职责的灵活性
PS: 一个请求可能到了最后都没能得到处理, 所以一定要注意逻辑的严密性
*/

import Foundation


class Request {
    var requestType: String?
    var requestContent: String?
    var requestNumber: Int?
}


class Manager {
    var name: String?
    var superior: Manager?
    init(tname: String) {
        name = tname
    }
    
    func setSuperior(manager: Manager) {
        superior = manager
    }
    
    func requestApplications(request: Request) {}
}


//经理
class CommonManager: Manager {
    override func requestApplications(request: Request) {
        if (request.requestType! == "请假" && request.requestNumber <= 2) {
            NSLog("职责链模式-> 两天内 经理直接批准")
        }else {
            if superior != nil {
                superior?.requestApplications(request)
            }
        }
        
    }
}

//总监
class Majordomo: Manager {
    override func requestApplications(request: Request) {
        if request.requestType! == "请假" && request.requestNumber <= 5 {
            NSLog("职责链模式-> 五天内 总监直接批准")
        }else {
            if superior != nil {
                superior?.requestApplications(request)
            }
        }
    }
}

//总经理
class GeneralManager: Manager {
    override func requestApplications(request: Request) {
        if request.requestType == "请假" && request.requestNumber <= 10 {
            NSLog("职责链模式-> 10天内 总经理批了")
        }else if request.requestType == "加薪" && request.requestNumber <= 500 {
            NSLog("职责链模式-> 500块内 总经理加薪了")
        }else if request.requestType == "加薪" && request.requestNumber > 500 {
            NSLog("职责链模式-> 500块内 总经理 考虑一下")
        }
    }
}
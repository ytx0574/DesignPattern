//
//  第二十三章-命令模式.swift
//  DesignPattern
//
//  Created by Johnson on 16/2/29.
//  Copyright © 2016年 Johnson. All rights reserved.
//

/*
命令模式: 将一个个请求封装为一个对象(Command), 从而使你可用不同的请求对客户进行参数优化, 对请求排队或记录请求日志, 以及支持可撤销的操作.   餐厅点菜其实就可以看作命令模式
好处: 
    1. 容易设计一个命令队列;
    2. 在需要的情况下, 可以较容易的将命令计入日志
    3. 允许接收请求的一方决定是否要否决请求
    4. 可以容易的实现撤销 重做
    5. 添加新命令不需要修改原有代码, 所以增加命令类很容易
*/


import Foundation

//命令   具体命令, 子类实现. 如: 烤鸡翅 烤串
class Command {
    var receiver: Receiver?
    init(tReceiver: Receiver) {
        receiver = tReceiver
    }

    func excute() {}
}


class ConcreteCommand: Command {
    override func excute() {
        receiver?.action()
    }
}


//执行者   服务员
class Invoker {
    var command: Command?
    func setCommand(tCommand: Command) {
        command = tCommand
    }
    
    func excuteCommand() {
        command?.excute()
    }
}


//接收者   烧烤师傅
class Receiver {
    func action() {
        NSLog("命令模式-> 执行请求: \"师傅, 需求过来了, 赶紧烤哈\"")
    }
}
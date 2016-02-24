//
//  第十六章-状态模式.swift
//  DesignPattern
//
//  Created by Johnson on 16/2/23.
//  Copyright © 2016年 Johnson. All rights reserved.
//


/*
状态模式: 主要用于一个对象的状态转换的条件过于复杂时使用, 把状态逻辑转移到不同状态的一系列类中.  减少条件之间的依赖性, 使其变得容易维护和拓展.
*/

import Foundation


class State {
    func writeProgram(work: Work) {}
}

//上午工作状态
class ForenoonState: State {
    override func writeProgram(work: Work) {
        if work.hour < 12 {
            NSLog("当前时间: \(work.hour), 上午工作, 精神百倍")
        }else {
            work.state = NoonState()
            work.writeProgram()
        }
    }
}
//中午工作状态
class NoonState: State {
    override func writeProgram(work: Work) {
        if work.hour < 13 {
            NSLog("当前时间: \(work.hour), 饿了, 午饭, 犯困 午休")
        }else {
            work.state = AfternoonState()
            work.writeProgram()
        }
    }
}
//下午工作状态
class AfternoonState: State {
    override func writeProgram(work: Work) {
        if work.hour < 17 {
            NSLog("当前时间: \(work.hour), 下午状态还不错, 继续努力")
        }else {
            work.state = EveningState()
            work.writeProgram()
        }
    }
}
//晚间工作状态
class EveningState: State {
    override func writeProgram(work: Work) {
        if work.finished {
            work.state = RestState()
            work.writeProgram()
        }else {
            if  work.hour < 21 {
                NSLog("当前时间: \(work.hour), 加班中, 累成狗√")
            }else {
                work.state = SleepingState()
                work.writeProgram()
            }
        }
    }
}

//睡眠状态
class SleepingState: State {
    override func writeProgram(work: Work) {
        NSLog("当前时间: \(work.hour), 扛不住了, 睡觉了")
    }
}

//下班休息状态
class RestState: State {
    override func writeProgram(work: Work) {
        NSLog("当前时间: \(work.hour), 下班了, 回家了")
    }
}


//工作类
class Work {
    var state: State = ForenoonState()
    var hour: Double = 0.0
    var finished: Bool = false
    
    func writeProgram() {
        state.writeProgram(self)
    }
}
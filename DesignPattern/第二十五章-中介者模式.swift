//
//  第二十五章-中介者模式.swift
//  DesignPattern
//
//  Created by Johnson on 16/3/1.
//  Copyright © 2016年 Johnson. All rights reserved.
//

/*
中介者模式: 用一个中介对象来封装一系列的对象交互, 中介者使各对象不需要显示的相互引用, 从而使其耦合松散, 而且可以独立地改变他们之间的交互.
好处: 拿联合国来说, 只需要联合国发生变化, 各国之间互不干扰 (减少国与国之间的耦合)
坏处: 控制集中化, 使得中介者变得复杂, 而变得不易维护
*/

import Foundation


//国家
class Country {
    var unitedNations: UnitedNations?
    init(tUnitedNations: UnitedNations) {
        unitedNations = tUnitedNations
    }
    
    func declare(message: String) {}
    func getMessage(message: String) {}
}

class USA: Country {
    override func declare(message: String) {
        unitedNations?.declare(message, country: self)
    }
    override func getMessage(message: String) {
        NSLog("中介者模式-> 获得USA消息: \(message)")
    }
}

class Iraq: Country {
    override func declare(message: String) {
        unitedNations?.declare(message, country: self)
    }
    override func getMessage(message: String) {
        NSLog("中介者模式-> 获得Iraq消息: \(message)")
    }
}



//联合国
class UnitedNations {
    func declare(message: String, country: Country) {}
}

//联合国安理会
class UnitedNationsSecurityCouncil: UnitedNations {
    
    override func declare(message: String, country: Country) {
        if country is USA {
            country.getMessage(message)
        }else if country is Iraq {
            country.getMessage(message)
        }
    }
    
}
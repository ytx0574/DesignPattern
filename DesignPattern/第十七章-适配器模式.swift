//
//  第十七章-适配器模式.swift
//  DesignPattern
//
//  Created by Johnson on 16/2/24.
//  Copyright © 2016年 Johnson. All rights reserved.
//

/*
适配器模式: 将一个类的接口转换成客户希望的另外一个接口.  使得原本由于接口不兼容二不能一起工作的类可以工作.   只有在双方都不容易修改的时候再使用适配器模式.
例如: 姚明到美国NBA打球, 由于不会英语, 所以需要一个翻译官(适配器)来进行比赛

*/

import Foundation


class Player {
    var name: String?
    
    init(tname: String) {
        name = tname
    }
    
    func attack() {}
    func defense() {}
}

//前锋
class Forwards: Player {
    
    override func attack() {
        NSLog("适配器模式-> 前锋\(self.name!) 进攻")
    }
    
    override func defense() {
        NSLog("适配器模式-> 前锋\(self.name!) 防守")
    }
}

//中锋
class Center: Player {

}

//后卫
class Guards: Player {
    
}


//外籍中锋
class ForeignCenter {
    var name: String?
    init(tname: String) {
        name = tname
    }
    
    func 进攻() {
        NSLog("适配器模式-> 外籍中锋%@ 进攻", self.name!)
    }
    func 防守() {
        NSLog("适配器模式-> 外籍中锋%@ 防守", self.name!)
    }
}


//适配器
class Translator: Player {
    var foreignCenter: ForeignCenter = ForeignCenter(tname: "姚明")
    
    override init(tname: String) {
        super.init(tname: tname)
        foreignCenter.name = tname
    }
    
    override func attack() {
        foreignCenter.进攻()
    }
    
    override func defense() {
        foreignCenter.防守()
    }
}
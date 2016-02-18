//
//  第八章-工厂方法模式.swift
//  DesignPattern
//
//  Created by Johnson on 16/2/18.
//  Copyright © 2016年 Johnson. All rights reserved.
//


/*
工厂方法模式: 定义一个用于创建对象的接口, 让子类决定实例化那一个类, 工厂方法使一个类的实例化延迟到子类  具体参见 "第八章-工厂方法模式.png"
与简单工厂模式的区别:
    1. 克服了简单工厂模式违背开放-封闭原则的缺点
    2. 保持了封装对象创建过程的优点, 集中了封装对象的创建, 使得更换对象时, 不需要做大的改动
*/

import Foundation


class Leifeng {  //雷锋
    func sweep(){}
    func wash() {}
    func buyRice() {}
}


class Undergraduate: Leifeng {  //学雷锋的大学生
    
}

class Volunteer: Leifeng { //社区志愿者
    
}


protocol LeifengFactory {
    func createLeifeng() -> Leifeng
}


class UndergraduateFactory: LeifengFactory {  //社区志愿者工厂
    func createLeifeng() -> Leifeng {
        return Undergraduate()
    }
}

class VolunteerFactory: LeifengFactory {   //学雷锋大学生工厂
    func createLeifeng() -> Leifeng {
        return Volunteer()
    }
}
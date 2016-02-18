//
//  第七章-代理模式.swift
//  DesignPattern
//
//  Created by Johnson on 16/2/18.
//  Copyright © 2016年 Johnson. All rights reserved.
//


/*
代理模式: RealSubject和Proxy都使用公共的接口Subject, Proxy类保留一个RealSubject实体, 然后通过在Proxy中的接口方法来通过实体对象调用真正的方法 具体参见 "第七章-代理模式.png"
代理模式应用:
    1. 远程代理: 为一个对象在不同的地址空间提供局部代表, 这样可以隐藏一个对象存在于不同地址空间的事实  例如: 在客户端使用WebServices来解决远程访问的问题
    2. 虚拟代理: 根据需要创建一个开销很大的对象, 通过它来实例化需要很长时间的真实对象   例如: 一个很大的HTML网页, 最开始看到所有的文字, 图片却是一张张的下载看到. 这些图片就是用虚拟代理来替代了真实的图片, 此时代理存储了真实图片的尺寸和路径
    3. 安全代理: 用来控制真实对象访问时的权限
    4. 智能指引: 当调用真实对象时, 代理处理另外一些事
*/


import Foundation



protocol GiveGift {
    func giveDolls()
    func giveFlowers()
    func giveChocolate()
}


class SchoolGirl {  //被追求者
    var name: String?
}



class Pursuit: GiveGift {  //追求者
    
    var schoolGirl: SchoolGirl?
    init(mm: SchoolGirl) {
        schoolGirl = mm
    }
    
    func giveDolls() {
        NSLog("\(schoolGirl?.name)送你洋娃娃")
    }
    
    func giveFlowers() {
        NSLog("\(schoolGirl?.name)送你鲜花")
    }
    
    func giveChocolate() {
        NSLog("\(schoolGirl?.name)送你巧克力")
    }
}

class Proxy: GiveGift {   //代理
    var gg: Pursuit?
    init(mm: SchoolGirl) {
        gg = Pursuit(mm: mm)
    }
    
    func giveDolls() {
        gg?.giveDolls()
    }
    
    func giveFlowers() {
        gg?.giveFlowers()
    }
    
    func giveChocolate() {
        gg?.giveChocolate()
    }
}
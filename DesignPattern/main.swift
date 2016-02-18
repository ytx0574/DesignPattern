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


//装饰模式   一层一层的穿衣服, 每穿一次, 就在现有的基础上选择再穿一点或者直接展示
var person: Person = Person()

var suit: Suit = Suit()
var bigThrouser: BigThrouser = BigThrouser()
var underpants: Underpants = Underpants()
var tshirts: Tshirts = Tshirts()

//第一种装扮(装饰模式)
suit.decorate(person)
bigThrouser.decorate(suit)
underpants.decorate(bigThrouser)
underpants.show()

//第二种装扮(装饰模式)
bigThrouser.decorate(person)
tshirts.decorate(bigThrouser)
suit.decorate(tshirts)
suit.show()


//代理模式
var schollGirl: SchoolGirl = SchoolGirl()
schollGirl.name = "MM"

var proxy: Proxy = Proxy(mm: schollGirl)
proxy.giveDolls()
proxy.giveFlowers()
proxy.giveChocolate()


//工厂方法模式  相比简单工厂模式的好处在于, 集中封装了对象的创建, 不需要做大的改动就可实现
VolunteerFactory().createLeifeng()

UndergraduateFactory().createLeifeng()







/*
    单一原则: 我们可以理解为就一个类而言, 应该仅有一个引起它变化的原因. 
    例如:
        如果一个类承担过多的职责, 就等于把这些职责耦合在一起, 一个职责的变化可能会削弱或者抑制这个类完成其他职责的能力. 这种耦合会导致一种脆弱的设计, 当变化发生时, 设计会遭到意想不到的错误


    开放-封闭原则: 有些东西一开始就想好之后再写, 然后就不要动了. 有些则是一开始考虑全面一点, 当需求变更时, 只在里面添加新的需求, 而不动原来的代码.
    例如:
        考研和求职这两件事, 考研制定的学习计划是雷打不动的, 这就是修改封闭. 但是考研的时间, 只顾着埋头学习, 就等于放弃好多的工作机会. 如果整天都在复习, 那效果可想而知, 所以可以抽出一点时间来收集资讯以及编写简历, 这样既不影响考研, 又增加了找到好工作的可能性, 这就是扩展开放原则

    
    依赖倒转原则: 
        1. 高层模块不应该依赖低层模块, 两个都应该依赖抽象
        2. 抽象不应该依赖细节, 细节应该依赖抽象
    例如:
        电脑的cpu和主板, 两者只需要遵循统一的接口, 不管是哪个型号的cpu和主板都可以混合使用, 而且不会影响到其它硬件的工作.  而cpu 内存只需要遵循主板接口, 哪个坏了换哪个. 而不像收音机一样, 耦合过度, 不管是因为哪种原因故障, 都很难查找问题来修复.


    里氏代换原则: 子类必须能够替换它们的父类型, 这里的替换是指子类可以替换掉父类, 并且软件功能不受影响时, 父类才能真正的被复用, 而子类还可以在父类的基础上增加新的功能
    例如: 
        鸟类拥有飞行, 吃, 叫, 但是企鹅却不能继承鸟类, 因为它不会飞. 不能完全替换父类.
*/
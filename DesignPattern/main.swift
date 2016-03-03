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




//建造者模式
var director: Director = Director()
var builder = ConcreteBuildA()
director.construct(builder)

var product:Product = builder.getResult()
product.show()


//抽象工厂模式

var databaseUser: DatabaseUser = DatabaseUser()
var databaseIDpartment: DatabaseIDpartment = DatabaseIDpartment()

var ifactory: IFactory = SqlIFactory()  //决定使用什么数据库

//用sql向iuser表插入数据
var iuser: IUser = ifactory.createUser()
iuser.insert(databaseUser)
iuser.getUser("xx")

//用sql向idpertment表插入数据
var idpartment: IDepartment = ifactory.createDepartment()
idpartment.insert(databaseIDpartment)
idpartment.getDepartment("xx")


//状态模式
var work: Work = Work()
work.hour = 11
work.writeProgram()

work.hour = 18
work.writeProgram()

work.hour = 20
work.writeProgram()

work.finished = true
work.writeProgram()


//适配器模式
var b: Player = Forwards(tname:"巴蒂尔")
b.defense()

var m: Player = Guards(tname:"麦克")
m.attack()

var t: Translator = Translator(tname: "姚明")
t.defense()



//组合模式
var company_beijing: Company = ConcreteCompany(tname:"总公司")
company_beijing.add(HRRepartment(tname:"人力资源部"))
company_beijing.add(FinanceDepartment(tname:"财务部"))

var company_chengdu: Company = ConcreteCompany(tname:"成都分公司")
company_chengdu.add(HRRepartment(tname:"成都分公司人力资源部"))
company_chengdu.add(FinanceDepartment(tname:"成都分公司财务部"))

var company_nanjing: Company = ConcreteCompany(tname:"南京分公司")
company_nanjing.add(FinanceDepartment(tname: "南京财务部"))
company_nanjing.add(HRRepartment(tname: "南京人力资源"))

company_beijing.add(company_chengdu)
company_beijing.add(company_nanjing)

company_beijing.display()



//简单的swift使用, 当作是复习吧
var list: [Company] = []
list.append(Company(tname: "aaa"))
list.append(Company(tname: "bbb"))
list.append(Company(tname: "ccc"))

 var index: Int? = list.indexOf { (c:Company) -> Bool in
    if c.name == "cccc" {
        return true
    }else {
        return false
    }
}

if index != nil {
    list.removeAtIndex(index!)
}

NSLog("\(list)")



//桥接模式
var abstraction: Abstraction = Abstraction()
abstraction.setImplementor(ConcreteImplementorA())
abstraction.operation()

abstraction.setImplementor(ConcreteImplementorB())
abstraction.operation()


//命令模式
var receiver: Receiver = Receiver()
var command: Command = ConcreteCommand(tReceiver: receiver)
var invoker: Invoker = Invoker()
invoker.setCommand(command)

invoker.excuteCommand()



//职责链模式
var commonManager: CommonManager = CommonManager(tname: "经理")
var majordomo: Majordomo = Majordomo(tname: "总监")
var generalManager: GeneralManager = GeneralManager(tname: "总经理")

commonManager.setSuperior(majordomo)
majordomo.setSuperior(generalManager)


var request: Request = Request()
request.requestType = "请假"
request.requestNumber = 3;
request.requestContent = "反正我是有事儿, 来点霸王假"

commonManager.requestApplications(request)



//中介中模式
var unitedNations: UnitedNations = UnitedNationsSecurityCouncil()

var usa: USA = USA(tUnitedNations: unitedNations)
usa.declare("不准研制核武器了")

var iraq: Iraq = Iraq(tUnitedNations: unitedNations)
iraq.declare("我们就是要研制核武器")


//享元模式
var webSiteFactory: WebSiteFactory = WebSiteFactory()
var webSite: WebSite = webSiteFactory.getWebSiteCategory("博客")
webSite.operation(User(tName: "张三丰"))

var webSite1: WebSite = webSiteFactory.getWebSiteCategory("产品展示")
webSite1.operation(User(tName: "张三丰"))

var webSite2: WebSite = webSiteFactory.getWebSiteCategory("博客")
webSite2.operation(User(tName: "刘得华"))


//访问者模式
var objectStruture: ObjectStruture = ObjectStruture()
objectStruture.attach(Man())
objectStruture.attach(WoMan())


var success: Success = Success()
objectStruture.display(success)

var failed: Failed = Failed()
objectStruture.display(failed)









/* -------------------------代码中未提及的模式---------------------------------------

    第三章-单一原则: 我们可以理解为就一个类而言, 应该仅有一个引起它变化的原因. 相机仅有单一的拍照功能
    例如:
        如果一个类承担过多的职责, 就等于把这些职责耦合在一起, 一个职责的变化可能会削弱或者抑制这个类完成其他职责的能力. 这种耦合会导致一种脆弱的设计, 当变化发生时, 设计会遭到意想不到的错误


    第四章-开放-封闭原则: 有些东西一开始就想好之后再写, 然后就不要动了. 有些则是一开始考虑全面一点, 当需求变更时, 只在里面添加新的需求, 而不动原来的代码.
    例如:
        考研和求职这两件事, 考研制定的学习计划是雷打不动的, 这就是修改封闭. 但是考研的时间, 只顾着埋头学习, 就等于放弃好多的工作机会. 如果整天都在复习, 那效果可想而知, 所以可以抽出一点时间来收集资讯以及编写简历, 这样既不影响考研, 又增加了找到好工作的可能性, 这就是扩展开放原则

    
    第五章-依赖倒转原则:
        1. 高层模块不应该依赖低层模块, 两个都应该依赖抽象
        2. 抽象不应该依赖细节, 细节应该依赖抽象
    例如:
        电脑的cpu和主板, 两者只需要遵循统一的接口, 不管是哪个型号的cpu和主板都可以混合使用, 而且不会影响到其它硬件的工作.  而cpu 内存只需要遵循主板接口, 哪个坏了换哪个. 而不像收音机一样, 耦合过度, 不管是因为哪种原因故障, 都很难查找问题来修复.


    第五章-里氏代换原则: 子类必须能够替换它们的父类型, 这里的替换是指子类可以替换掉父类, 并且软件功能不受影响时, 父类才能真正的被复用, 而子类还可以在父类的基础上增加新的功能
    例如: 
        鸟类拥有飞行, 吃, 叫, 但是企鹅却不能继承鸟类, 因为它不会飞. 不能完全替换父类.

    
    第九章-原型模式: 用原型实例指定创建对象的种类, 并且通过拷贝这些原型创建新对象 (浅复制 深复制)   简历复制


    第十章-模板方法模式: 定义一个操作中的算法的骨架, 而将一些步骤延迟到子类中. 模板方法使得可以不改变一个算法的结构即可重定义该算法的某些特定步骤.  例如卷子上面的题, 每张卷子的题差不多, 但都有可能从一个固定的模板上面选定的一些题目

    
    第十一章-迪米特法则: 如果两个类不必彼此通信, 那么这两个类就不应当发生直接的相互作用. 如果其中一个类需要调用另外一个类的某一个方法的话, 可以通过第三者转发这个调用.  迪米特法则的基本思想是强调类之间的松耦合, 耦合越弱, 就越有利于复用. 一个处于若引用的类被修改, 不会对有关系的类照成影响
    例如:
        当需要it部装电脑时, 不需要具体认识里面哪位, 直接找it部即可. 至于具体谁来装, 让it部自己去分配即可


    第十二章-外观模式: 为子系统的一组接口提供一个一致的界面, 此模式定义了一个高层接口, 这个接口使得这一子系统更加容易使用
    例如: 股民买股票, 可以直接买, 也可以直接购买基金,  而基金则只需要关注涨还是跌, 其后面的工作都是投资人在操作. 直接买股票将面临多支股票的买入买出, 复杂而使耦合性增加, 不适用新手, 极其容易亏损


    第十四章-观察者模式: 定义一种一对多的依赖关系, 让多个观察者对象同时监听某一个主题对象. 这个主题对象在状态发生变化时, 会通知所有的观察者对象.   类似Touch事件, 通知各部位做出相应的变化


    第二十章-迭代器模式: 提供一种方法顺序访问一个聚合对象中的各个元素, 而又不暴露该对象内部的表示   数组就是一个很好的迭代器


    第二十一章-单例模式: 保证一个类仅有一个实例, 并提供一个它的全局访问点, 注意多线程的单例使用.lock  通常的做法是让其自身负责保存它唯一的实例


    第二十七章-解释器模式: 给定一个语言, 定义好它的文法的一种表示, 并定义一个解释器, 这个解释器使用该表示来解释语言中的句子   正则, 编译器, 其实利用的就是解释器来实现的

*/
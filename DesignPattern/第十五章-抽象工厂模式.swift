//
//  第十五章-抽象工厂模式.swift
//  DesignPattern
//
//  Created by Johnson on 16/3/3.
//  Copyright © 2016年 Johnson. All rights reserved.
//

/*
抽象工厂模式: 提供一种创建一系列相关或相互依赖对象接口, 而无需指定她们具体的类.   例如本身是SQL数据库, 然后添加Access数据库, 即可使用抽象工厂模式
好处: 如果需要改变数据库, 只需要具体的工厂对象. ps: 改变具体的数据库, 可以使用反射技术, 不至于写死
坏处: 增加表就需要 增加 数据对象 Sql操作对象 Access操作对象 还需要修改factory
*/

import Foundation

protocol IUser {
    func insert(user: DatabaseUser)
    func getUser(id: String)
}

protocol IDepartment {
    func insert(department: DatabaseIDpartment)
    func getDepartment(id: String)
}

protocol IFactory {
    func createUser() -> IUser
    func createDepartment() -> IDepartment
}


//表数据
class DatabaseUser {
    var name: String?
    var id: String?
}

class DatabaseIDpartment {
    var name: String?
    var id: String?
}

//iuser表的两种数据库操作
class SqlIUser: IUser {
    func insert(user: DatabaseUser) {
        NSLog("抽象工厂模式-> 在SQL中给user表增加一条记录")
    }
    
    func getUser(id: String) {
        NSLog("抽象工厂模式-> 在SQL中根据id查询user表的一条记录")
    }
}

class AccessIUser: IUser {
    func insert(user: DatabaseUser) {
        NSLog("抽象工厂模式-> 在Access中给user表增加一条记录")
    }
    
    func getUser(id: String) {
        NSLog("抽象工厂模式-> 在Access中根据id查询user表的一条记录")
    }
}


//idpartment表的两种数据库操作
class SqlIDepartment: IDepartment {
    func insert(department: DatabaseIDpartment) {
        NSLog("抽象工厂模式-> 在SQL中给department表增加一条记录")
    }
    
    func getDepartment(id: String) {
        NSLog("抽象工厂模式-> 在SQL中根据id得到department表的一条记录")
    }
}

class AccessIDepartment: IDepartment {
    func insert(department: DatabaseIDpartment) {
        NSLog("抽象工厂模式-> 在Access中给department表增加一条记录")
    }
    
    func getDepartment(id: String) {
        NSLog("抽象工厂模式-> 在Access中根据id得到department表的一条记录")
    }
}



//根据具体的工厂对象创建具体的数据库
class SqlIFactory: IFactory {
    func createUser() -> IUser {
        return SqlIUser()
    }
    func createDepartment() -> IDepartment {
        return SqlIDepartment()
    }
}

class AccessIFactory: IFactory {
    func createUser() -> IUser {
        return AccessIUser()
    }
    func createDepartment() -> IDepartment {
        return AccessIDepartment()
    }
}
//
//  login.swift
//  resume
//
//  Created by Bober on 29/05/2020.
//  Copyright © 2020 AntonBu. All rights reserved.
//


struct Login {
    let usernamme: String
    let password: String
}

let account = Login(usernamme: "Bober", password: "qazwsx")

struct UserInfo {
    let name: String
    let surname: String
    let age: Int
    let city: String
}

let bober = UserInfo(name: "Антон",
                     surname: "Буренин",
                     age: 28,
                     city: "Красногорск")

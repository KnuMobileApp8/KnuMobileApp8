//
//  Display.swift
//  KnuMobileApp8
//
//  Created by Dean on 2023/05/17.
//

import Foundation

struct Display : Identifiable{
    var id = UUID()
    let title: String
    let place: String
    let gubun: String
    let date: String
    let price: String
}

var displays = [
    Display(title: "Popo", place: "대구미술관", gubun: "전시", date: "2023-01-02 ~ 2023-01-08", price: "3000"),
    Display(title: "Can I B U", place: "동성로아트홀", gubun: "공연", date: "2023-02-02 ~ 2023-02-08", price: "free"),
    Display(title: "Lovelovelove", place: "대구미술관", gubun: "전시", date: "2023-03-02 ~ 2023-03-08", price: "12000"),
    Display(title: "Datoom", place: "동성로아트홀", gubun: "공연", date: "2023-04-02 ~ 2023-04-08", price: "free"),
    Display(title: "Popo", place: "대구미술관", gubun: "전시", date: "2023-01-02 ~ 2023-01-08", price: "3000"),
    Display(title: "Can I B U", place: "동성로아트홀", gubun: "공연", date: "2023-02-02 ~ 2023-02-08", price: "free"),
    Display(title: "Lovelovelove", place: "대구미술관", gubun: "전시", date: "2023-03-02 ~ 2023-03-08", price: "12000"),
    Display(title: "Datoom", place: "동성로아트홀", gubun: "공연", date: "2023-04-02 ~ 2023-04-08", price: "free")
]

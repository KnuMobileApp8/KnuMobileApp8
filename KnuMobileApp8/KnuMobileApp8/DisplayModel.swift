//
//  Information.swift
//  KnuMobileApp8
//
//  Created by Dean on 2023/05/19.
//

import Foundation
import SwiftUI
import Alamofire

class DisplayModel: ObservableObject {
    @Published var displays: [Display]
    
    func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM"
        let currentDate = formatter.string(from: Date())
        return currentDate
    }
    
    init() {
        self.displays = []
        getInfo(about: "DP")
        getInfo(about: "PF")
    }
    
    func getInfo(about gubun: String) {
        let url = "https://dgfca.or.kr/ajax/event/list.json?event_gubun=\(gubun)&start_date=\(getCurrentDate())"
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: ["Content-Type":"application/json;charset=utf-8", "Accept":"application/json;charset=utf-8"])
        .validate(statusCode: 200..<300)
        .responseDecodable(of: [Display].self) { response in
            switch response.result {
            case .success(let data):
                self.displays.append(contentsOf: data)
                print(self.displays[0])
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

extension DisplayModel {
    func toggleWish(of display: Display) {
        guard let index = displays.firstIndex(of: display) else {
            return
        }
        displays[index].isWished.toggle()
    }
}






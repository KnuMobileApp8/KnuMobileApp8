//
//  Display.swift
//  KnuMobileApp8
//
//  Created by Dean on 2023/05/17.
//

import Foundation
import MapKit

struct Display: Codable {
    let endDate, payGubunName, payGubun, subject: String
    let place: String
    let content: JSONNull?
    let eventGubunName, eventGubun, startDate: String
    var id: UUID = UUID()
    var isWished: Bool = false
    var placemark: MKPlacemark?
    var coordinate: CLLocationCoordinate2D?
    
    enum CodingKeys: String, CodingKey {
        case endDate = "end_date"
        case payGubunName = "pay_gubun_name"
        case payGubun = "pay_gubun"
        case subject, place, content
        case eventGubunName = "event_gubun_name"
        case eventGubun = "event_gubun"
        case startDate = "start_date"
    }
}

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

extension Display: Identifiable {}
extension Display: Equatable {
    static func == (lhs: Display, rhs: Display) -> Bool {
        return true
    }
}

var displaySamples = [
    Display(endDate: "aaa", payGubunName: "Aaa", payGubun: "AAA", subject: "AAA", place: "AAA", content: JSONNull(), eventGubunName: "aa", eventGubun: "AA", startDate: "AAAA", placemark: nil, coordinate: nil),
    Display(endDate: "aaa", payGubunName: "Aaa", payGubun: "AAA", subject: "AAA", place: "AAA", content: JSONNull(), eventGubunName: "aa", eventGubun: "AA", startDate: "AAAA", placemark: nil, coordinate: nil),
]


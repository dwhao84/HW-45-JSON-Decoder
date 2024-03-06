import UIKit

import Foundation

// 定義結構體以匹配 JSON 結構
struct Country: Codable {
    let name: Name
    let tld: [String]?
    let cca2: String?
    let ccn3: String?
    let cca3: String?
    let cioc: String?
    let independent: Bool?
    let unMember: Bool?
    let currencies: [String: Currency]?
    let idd: Idd
    let capital: [String]?
    let altSpellings: [String]?
    let region: String
    let subregion: String?
    let languages: [String: String]?
    let translations: [String: Translation]?
    let latlng: [Double]?
    let landlocked: Bool
    let area: Double
    let demonyms: [String: Demonym]?
    let flag: String
    let maps: Maps
    let population: Int
    let gini: [String: Double]?
    let fifa: String?
    let car: Car
    let timezones, continents: [String]
    let flags: ImageURLs
    let coatOfArms: ImageURLs
    let startOfWeek: String
    let capitalInfo: CapitalInfo
    let postalCode: PostalCode?
}

struct Name: Codable {
    let common, official: String
    let nativeName: [String: NativeName]?
}

struct NativeName: Codable {
    let official, common: String
}

struct Currency: Codable {
    let name: String
    let symbol: String?
}

struct Idd: Codable {
    let root: String?
    let suffixes: [String]?
}

struct Translation: Codable {
    let official: String?
    let common: String?
}

struct Demonym: Codable {
    let f, m: String
}

struct Maps: Codable {
    let googleMaps: String?
    let openStreetMaps: String?
}

struct Car: Codable {
    let signs: [String]?
    let side: String
}

struct ImageURLs: Codable {
    let png: String?
    let vg: String?
}

struct CapitalInfo: Codable {
    let latlng: [Double]?
}

struct PostalCode: Codable {
    let format: String?
    let regex: String?
}

// 解析 JSON 資料的函數
func fetchCountryData() {
    guard let url = URL(string: "https://restcountries.com/v3.1/all") else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else {
            print(error?.localizedDescription ?? "Unknown error")
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let countries = try decoder.decode([Country].self, from: data)
            // 現在可以使用解析後的國家資料了
            // 例如，列印每個國家的首都和面積
            for country in countries {
                print("\(country.name.common): \(country.capital?.first ?? "No capital"), Area: \(country.area) km²")
            }
        } catch {
            print("Decoding error: \(error)")
        }
    }.resume()
}

// 呼叫函數以啟動解析過程
fetchCountryData()

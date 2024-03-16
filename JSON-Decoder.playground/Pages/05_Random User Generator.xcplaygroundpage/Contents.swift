
/*
Random User URL:
https://randomuser.me/?source=post_page-----3b89559c0aa8--------------------------------
 
JSON Address:
 https://randomuser.me/api/
*/

import UIKit

struct RandomUserData: Decodable {
    let results: [Results]
    let info: Info
}

struct Results: Decodable {
    let gender: String
    let name: Name        // 不太確定，應該是Dict
    let location: Location
    let email: String
    let login: Login
    let registered: Registered
    let phone: String
    let cell: String
    let id: Id
    let picture: Picture
    let nat: String
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}

struct Location: Decodable {
    let street: Street?
    let city: String
    let state: String
    let country: String
    let postcode: Int?
    let coordinates: Coordinates
    let timezone: Timezone
}

struct Street: Decodable {
    let number: Int
    let name: String
}

struct Coordinates: Decodable {
    let latitude: String
    let longitude: String
}

struct Timezone: Decodable {
    let offset: String
    let description: String
}

struct Login: Decodable {
    let uuid: String
    let username: String
    let password: String
    let salt: String
    let md5: String
    let sha1: String
    let sha256: String
}

struct Registered: Decodable{
    let date: Date
    let age: Int
}

struct Id: Decodable {
    let name: String
    let value: String?
}

struct Picture: Decodable {
    let large: URL
    let medium: URL
    let thumbnail: URL
}

struct Info: Decodable {
    let seed: String
    let results: Int
    let page: Int
    let version: String
}

func fetchRandomUserData() {
    guard let url = URL(string: "https://randomuser.me/api/") else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else {
            print(error ?? "Can't get the data" )
            return
        }
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
            let randomUserData = try decoder.decode(RandomUserData.self, from: data)
            print(randomUserData.info.page)
            print(randomUserData.info.seed)
            print(randomUserData.info.results)
            print(randomUserData.info.version)
            
        } catch {
            print("資料錯誤:\(error)")
        }
    }.resume()
}

fetchRandomUserData()


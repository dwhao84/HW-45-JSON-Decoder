
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
    let dob: Dob
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
    let street: Street
    let city: String
    let state: String
    let country: String
    let postcode: Int
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

struct Dob: Decodable {
    let date: Date
    let age: Int
}

struct Registered: Decodable{
    let date: Date
    let age: Int
}

struct Id: Decodable {
    let name: String
    let value: Double?
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

func fetchData() {
    guard let url = URL(string: " https://randomuser.me/api/") else { return }
    
    
    
}

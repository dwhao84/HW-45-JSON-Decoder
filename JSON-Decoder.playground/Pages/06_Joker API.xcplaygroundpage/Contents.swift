
/*
Random User URL:
 https://jokeapi.dev/?source=post_page-----3b89559c0aa8--------------------------------
 
JSON Address:
 https://v2.jokeapi.dev/joke/Any
*/

import UIKit

struct Joker: Decodable {
    let error: Bool
    let category: String
    let type: String
    let joke: String?
    let flags: Flags
    let id: Int
    let safe: Bool
    let lang: String
}

struct Flags: Decodable {
    let nsfw: Bool
    let religious: Bool
    let political: Bool
    let racist: Bool
    let sexist: Bool
    let explicit: Bool
}

func fetchJoke() {
    guard let url = URL(string: "https://v2.jokeapi.dev/joke/Any") else {
        print("Invalid URL")
        return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else {
            print(error?.localizedDescription ?? "Can't get the data")
            return
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let jokeData = try decoder.decode(Joker.self, from: data)
            print(jokeData.error)
            print(jokeData.id)
        } catch {
            print("Decoding error: \(error)")
        }
    }.resume()
}

fetchJoke()


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
    let joke: String
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
    // 假设这是您从网络获取的 JSON 数据
    let jsonData = """
    {
        "error": false,
        "category": "Misc",
        "type": "single",
        "joke": "Stop being homophobic and rude to the LGBTQ+ community. You should be thanking them for saving us plenty of room in heaven.",
        "flags": {
            "nsfw": false,
            "religious": true,
            "political": false,
            "racist": false,
            "sexist": false,
            "explicit": false
        },
        "id": 114,
        "safe": false,
        "lang": "en"
    }
    """.data(using: .utf8)!

    do {
        let decoder = JSONDecoder()
        let jokeData = try decoder.decode(Joker.self, from: jsonData)
        print(jokeData.error)
        print(jokeData.id)
    } catch {
        print(error)
    }
}

fetchJoke()

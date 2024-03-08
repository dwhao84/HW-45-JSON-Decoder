
import UIKit

struct Apple: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let id: String
    let author: Author
    let links: [Link]?
    let copyright: String
    let country: String
    let icon: URL
    let updated: String
    let results: [Result]
}

struct Author: Decodable {
    let name: String
    let url:  URL
}

struct Link: Decodable {
    let `self`: URL
}

struct Result: Decodable {
    let artistName: String
    let id: String
    let name: String
    let releaseDate: Date
    let kind: String
    let artistId: String
    let artistUrl: URL
    let artworkUrl100: URL
    let genres: [Genre]
    let url: URL
}

struct Genre: Decodable {
    let genreId: String
    let name: String
    let url: URL
}

func fetchData () {
    guard let url = URL(string: "https://rss.applemarketingtools.com/api/v2/tw/music/most-played/10/songs.json") else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else {
            print(error?.localizedDescription ?? "Can't get the data")
            return
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            let appleData = try decoder.decode(Apple.self, from: data)
            print(appleData.feed.title)
            print(appleData.feed.id)
            print(appleData.feed.author)
            print(appleData.feed.copyright)
            print(appleData.feed.country)
            print(appleData.feed.icon)
            print(appleData.feed.results)
            
        } catch {
            print(error)
        }
    }.resume()
}

fetchData()

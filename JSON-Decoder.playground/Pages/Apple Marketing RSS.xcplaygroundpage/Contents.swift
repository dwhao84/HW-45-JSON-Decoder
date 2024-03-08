
import UIKit

struct Apple: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let id: String
    let author: Author
    let links: [Links]
    let copyright: String
    let country: String
    let icon: URL
    let updated: String
    let results: [Results]
}

struct Author: Decodable {
    let name: String
    let url:  URL
}

struct Links: Decodable {
    let selfs: URL
}

struct Results: Decodable {
    let artistName: String
    let id: String
    let name: String
    let releaseDate: Date
    let kind: String
    let artistId: String
    let artistUrl: URL
    let artworkUrl100: URL
    let genres: [Genres]
    let url: URL
}

struct Genres: Decodable {
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
            let appleData = try decoder.decode(Apple.self, from: data)
            print(appleData.feed.title)
            print(appleData.feed.id)
            print(appleData.feed.author)
            print(appleData.feed.links)
        } catch {
            print(error)
        }
    }.resume()
}

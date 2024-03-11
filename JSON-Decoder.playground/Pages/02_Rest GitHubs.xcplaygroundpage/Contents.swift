
// GitHubs API
// https://api.github.com/users/twostraws/followers

import UIKit

struct GitHubs: Codable {
    let login: String
    let id: Int
    let node_id: String
    let avatar_url: URL
    let gravatar_id: String
    let url: String
    let html_url: String
    let followers_url: URL
    let following_url: URL
    let gists_url: URL
    let starred_url: URL
    let subscriptions_url: URL
    let organizations_url: URL
    let repos_url: URL
    let events_url: URL
    let received_events_url: URL
    let type: String
    let site_admin: Bool
}

func fetchGitHubsData () {
    guard let url = URL(string: "https://api.github.com/users/twostraws/followers") else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else {
            print(error?.localizedDescription ?? "Unknown error")
            return
        }
        do {
            let decoder = JSONDecoder()
            let followerList = try decoder.decode([GitHubs].self, from: data)
                for followerData in followerList {
                    print("The login is: \(followerData.login)")
                    print("The id is: \(followerData.id)")
                    print("The node_id is: \(followerData.node_id)")
                    print("The avatar_url is: \(followerData.avatar_url)")
                    print("The gravatar_id is: \(followerData.gravatar_id)")
                    print("The url is: \(followerData.url)")
                    print("The html_url is: \(followerData.html_url)")
                    print("The followers_url is: \(followerData.followers_url)")
                    print("The following_url is: \(followerData.following_url)")
                    print("The gists_url is: \(followerData.gists_url)")
                    print("The starred_url is: \(followerData.starred_url)")
                    print("The subscriptions_url is: \(followerData.subscriptions_url)")
                    print("The organizations_url is: \(followerData.organizations_url)")
                    print("The repos_url is: \(followerData.repos_url)")
                    print("The events_url is: \(followerData.events_url)")
                    print("The received_events_url is: \(followerData.received_events_url)")
                    print("The type is: \(followerData.type)")
                    print("The site_admin is: \(followerData.site_admin)")
                    print("")
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }

fetchGitHubsData ()

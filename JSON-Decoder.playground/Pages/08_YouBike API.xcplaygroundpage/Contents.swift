/*
 Youbike URL:
 https://data.taipei/dataset/detail?id=c6bc8aed-557d-41d5-bfb1-8da24f78f2fb
 
 JSON Address:
 https://tcgbusfs.blob.core.windows.net/dotapp/youbike/v2/youbike_immediate.json
 */

import UIKit

struct YouBikeData: Decodable {
    let sno: String
    let sna: String
    let tot: Int
    let sbi: Int
    let sarea: String
    let mday: String
    let lat: Double
    let lng: Double
    let ar: String
    let sareaen: String
    let aren: String
    let bemp: Int
    let act: String
    let srcUpdateTime: String
    let updateTime: String
    let infoTime: String
    let infoDate: String
}

func fetchData () {
    guard let url = URL(string: " https://tcgbusfs.blob.core.windows.net/dotapp/youbike/v2/youbike_immediate.json") else {
        return
    }
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data, error == nil  else {
            print(error?.localizedDescription ?? "Can't get the data")
            return
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let youbikeDataset = try decoder.decode([YouBikeData].self, from: data)
            
            if let firstStation = youbikeDataset.first {
                print("DEBUG PRINT: Youbike資料:\(firstStation.bemp)")
                print("DEBUG PRINT: 所有的Youbike區域:\(firstStation.sareaen)")
                print("DEBUG PRINT: 目前Youbike的車位總數資料\(firstStation.tot)")
            }
        } catch {
            print(error)
        }
    }
    task.resume()
}

fetchData()

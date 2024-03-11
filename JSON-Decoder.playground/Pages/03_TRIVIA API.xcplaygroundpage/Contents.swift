
/*
 TRIVIA API:
 https://opentdb.com/api.php?amount=10
 */

import UIKit

struct Trivia: Codable {
    let response_code: Int?
    let results: [TriviaData]
}

struct TriviaData: Codable {
    let type: String
    let difficulty: String
    let category: String
    let question:String
    let correct_answer: String
    let incorrect_answers: [String]
}

func fetchData () {
    guard let url = URL(string: "https://opentdb.com/api.php?amount=10") else {
        return
    }
    URLSession.shared.dataTask(with: url) { data, responde, error in
        guard let data = data else {
            print(error?.localizedDescription ?? "Unknown error")
            return
        }
        do {
            let decoder = JSONDecoder()
            let trivia = try decoder.decode(Trivia.self, from: data)
            if let firstQuestion = trivia.results.first {
                 
                print(firstQuestion.question)
                print(firstQuestion.type)
                print(firstQuestion.difficulty)
                print(firstQuestion.category)
                print(firstQuestion.question)
                print(firstQuestion.correct_answer)
                print(firstQuestion.incorrect_answers)
                
            } else {
                print("No question found")
            }
        } catch {
            print("Decoding error: \(error)")
        }
    }.resume()
}

fetchData()

//
//  ViewController.swift
//  testCodable
//
//  Created by KS on 2021/11/14.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!

    struct UsersInfo: Codable {
        var userId: Int
        var id: Int
        var title: String
        var completed: Bool
    }

    @IBAction func requestButtonTapped(_ sender: Any) {

        AF.request("https://jsonplaceholder.typicode.com/todos/1") { urlRequest in }
        .response{ response in

            guard let data = response.data else { return }
            let jsonObject = try? JSONDecoder.init().decode(UsersInfo.self, from: data)

            guard let userID = jsonObject?.userId else { return }
            guard let id = jsonObject?.id else { return }
            guard let title = jsonObject?.title else { return }
            guard let completed = jsonObject?.completed else { return }

            self.userIDLabel.text = "userID: \(userID)"
            self.idLabel.text = "id: \(id)"
            self.titleLabel.text = "title: \(title)"
            self.completedLabel.text = "completed: \(completed)"
        }
    }
}

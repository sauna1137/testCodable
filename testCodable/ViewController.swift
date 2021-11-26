//
//  ViewController.swift
//  testCodable
//
//  Created by KS on 2021/11/14.
//

import UIKit
import Alamofire

class ViewController: UIViewController {


    // API
    //    {
    //     "apis": {
    //
    //         "totalContents": { "total": 2 } ,
    //
    //         "feeds": [
    //             {
    //                 "userId": 2,
    //                 "id": 3,
    //
    //             },
    //
    //             {
    //                 "userId": 6,
    //                 "id": 9,
    //             }
    //             ]
    //             // feeds
    //     }
    //    // apis
    //    }

    struct AWSAPI: Codable {
        let apis: APIs

        struct APIs: Codable {
            let totalContents: TotalContents
            let feeds: [Feeds]
        }

        struct TotalContents: Codable {
            let total: Int
        }

        struct Feeds: Codable {
            let userId: Int
            let id: Int
        }
    }


    @IBAction func requestButtonTapped(_ sender: Any) {

        AF.request("****************************************************") { urlRequest in }
        .response{ response in

            guard let data = response.data else { return }

            do {
                let json = try JSONDecoder().decode(AWSAPI.self, from: data)
                print(json)

                let total = json.apis.totalContents.total
                print(total)

                for i in 0...total - 1 {

                    let userID = json.apis.feeds[i].userId
                    let id = json.apis.feeds[i].id

                    print(userID,id)

                }

            } catch { print(error.localizedDescription ) }
        }
    }
}

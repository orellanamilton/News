//
//  NewsAPI.swift
//  NewsAPP
//
//  Created by Milton Orellana on 15/05/2021.
//

import Foundation
import Alamofire

func NewsAPI() {
    
    
    let urlString = "https://newsapi.org/v2/top-headlines?country=ar&apiKey=04f4ad8a121c411fb32fcb72e232de5f"
    
    let request = AF.request(urlString)
    
    request.responseJSON { (response) in
        do {
            guard let data = response.data else {
                return
            }
            
            let decode = JSONDecoder()
            let news = try decode.decode(NewsData.self, from: data)
        } catch {
            print(error)
        }
    }
}

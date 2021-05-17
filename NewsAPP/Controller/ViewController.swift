//
//  ViewController.swift
//  NewsAPP
//
//  Created by Milton Orellana on 15/05/2021.
//

import UIKit
import Alamofire
import SafariServices

// NewsCell

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var news: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NewsCell")
        
        title = "News"
        tableView.dataSource = self
        tableView.delegate = self
        NewsAPI()
    }
    
    func NewsAPI() {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=04f4ad8a121c411fb32fcb72e232de5f"
        let request = AF.request(urlString)
        
        request.responseJSON { (response) in
            do {
                guard let data = response.data else {
                    return
                }
                let decode = JSONDecoder()
                let listOfNews = try decode.decode(NewsData.self, from: data)
                self.news = listOfNews.articles
                self.tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }

    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let news = news[row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as! NewsTableViewCell
        cell.configure(for: news)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let news = news[row]
        
        let url = URL(string: news.url)!
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    
}

//
//  NetworkManger.swift
//  HackerNews
//
//  Created by Devasurya on 05/03/24.
//

import Foundation
class NetworkManger:ObservableObject {
    
    /// Variable declarations.
    @Published var postdata : [Post] = []
    
        /// fetchData - API initailization.
    func fetchData (){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task =  session.dataTask(with: url){(data,response,error) in
                if  error == nil {
                    let decoder = JSONDecoder()
                    if let data = data {
                        do{
                            let results = try decoder.decode(Results.self, from: data)
                            DispatchQueue.main.async {
                                self.postdata = results.hits
                            }
                        }
                        catch {
                            print("error")
                        }
                    }
                }
                
            }
            task.resume()
        }
    }
}


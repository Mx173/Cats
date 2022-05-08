//
//  CatsViewController.swift
//  Cats!
//
//  Created by Oleh Pazynich on 2022/04/22.
//

import Foundation

@MainActor class CatsViewModel : ObservableObject {
    private let url = "https://api.thecatapi.com/v1/images/search?api_key=4e515871-446e-4548-8a86-6a89db366811&mime_types=jpg&mime_types=png&limit=12"
    
    @Published var catList: [Cat] = []
    @Published var oneKitty: Cat = Cat()
    
    func GetCats() async {
        if catList == [] {
            guard let urlRequest = URL(string: url) else {
                print("Invalid url")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: urlRequest)
                if let decodedResponse = try? JSONDecoder().decode([Cat].self, from: data) {
                    catList = decodedResponse
                    oneKitty = decodedResponse[0]
                    print(oneKitty.url)
                } else {
                    print("Decoding Error")
                }
                
               
            } catch {
                print("Error request")
            }
        }
    }
}

//
//  AdviceManager.swift
//  Adwise
//
//  Created by Kadir Emre on 3.12.2021.
//

import Foundation

class AdviceManager{
    
    var mySlip : Slip?
    
    func getAdvice(){

        let urlString = "https://api.adviceslip.com/advice"
        
        guard let url = URL(string: urlString) else {
                return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
        guard let data = data, error == nil else {
                return
            }
            
        do {
            let result = try JSONDecoder().decode(Advice.self, from: data)
                
            DispatchQueue.main.async {
                self.mySlip = result.slip
            }
                
        } catch {
            print(error)
        }
    }
        task.resume()
}
}
    

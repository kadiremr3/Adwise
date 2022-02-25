//
//  AdviceManager.swift
//  Adwiser
//
//  Created by Kadir Emre on 3.12.2021.
//

import Foundation

class AdviceManager{
    
    var mySlip : Advice?
    var result : Advice?
    
    func getAdvice() -> Advice?{
        
        let urlString = "https://api.adviceslip.com/advice"
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                
                self.result = try JSONDecoder().decode(Advice.self, from: data)

            } catch {
                print(error)
            }
            
        }
        
        task.resume()
        
        return result
    }
}

//
//  NeworkingService.swift
//  StarWarsAPI
//
//  Created by Gustavo Aryel de Amo on 18/03/2019.
//  Copyright © 2019 gamo. All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = [String: Any]

class NetworkingService {
    
    static let shared = NetworkingService()
    private init() {}
    
    func getPeople(success successBlock: @escaping (GetPeopleResponse) -> Void) {
        Alamofire.request("http://swapi.co/api/people/").responseJSON { response in
            guard let json = response.result.value as? JSON else { return }
            do {
                let getPeopleResponse = try GetPeopleResponse(json: json)
                successBlock(getPeopleResponse)
            } catch {}
        }
    }
    
    
    func getHomeworld(homeworldLink: String, completion: @escaping (String) -> Void) {
        Alamofire.request(homeworldLink).responseJSON { (response) in
            guard let json = response.result.value as? JSON,
                let name = json["name"] as? String
                else { print("NOPE"); return }
            print("GOT HERE")
            completion(name)
        }
    }
    
}

//
//  GetPeopleResponse.swift
//  StarWarsAPI
//
//  Created by Gustavo Aryel de Amo on 18/03/2019.
//  Copyright © 2019 gamo. All rights reserved.
//

import Foundation

struct GetPeopleResponse {
    
    let people: [Person]
    
    init(json: JSON) throws {
        guard let results = json["results"] as? [JSON] else { throw NetworkingError.badNetworkingstuff }
        let people = results.map{ Person(json: $0) }.compactMap { $0 }
        self.people = people
        
    }
}

//
//  CodeableBootcamp.swift
//  CoreDataBootcamp
//
//  Created by Frank Bara on 12/13/21.
//

import SwiftUI

// Codable = Decodeable + Encodeable
struct CustomerModel: Identifiable, Codable {
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
    
    // Below is only needed if use Decodeable and Encodeable (not if using Codeable):
//    enum codingKeys: String, CodingKey {
//        case id
//        case name
//        case points
//        case isPremium
//    }
//
//    init(id: String, name: String, points: Int, isPremium: Bool) {
//        self.id = id
//        self.name = name
//        self.points = points
//        self.isPremium = isPremium
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: codingKeys.self)
//        self.id = try container.decode(String.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.points = try container.decode(Int.self, forKey: .points)
//        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: codingKeys.self)
//        try container.encode(name, forKey: .name)
//        try container.encode(id, forKey: .id)
//        try container.encode(points, forKey: .points)
//        try container.encode(isPremium, forKey: .isPremium)
//    }

}

class CodeableViewModel: ObservableObject {
    
    @Published var customer: CustomerModel? = CustomerModel(id: "1", name: "Frank", points: 10, isPremium: true)
    
    init() {
        getData()
    }

    
    func getData() {
        guard let data = getJSONData() else { return }
        
        self.customer = try? JSONDecoder().decode(CustomerModel.self, from: data)
        

        // above is same as below only more efficient
//        do {
//        self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
//        } catch let error {
//            print("Error decoding: \(error)")
//        }
        
//        if
//            let localData = try? JSONSerialization.jsonObject(with: data, options: []),
//            let dictionary = localData as? [String: Any],
//            let id = dictionary["id"] as? String,
//            let name = dictionary["name"] as? String,
//            let points = dictionary["points"] as? Int,
//            let isPremium = dictionary["isPremium"] as? Bool {
//
//
//            let newCustomer = CustomerModel(id: id, name: name, points: points, isPremium: isPremium)
//            customer = newCustomer
//
//        }
    }
    
    func getJSONData() -> Data? {
        
        let customer = CustomerModel(id: "111", name: "Lisa", points: 100, isPremium: false)
        let jsonData = try? JSONEncoder().encode(customer)
//        let dict: [String:Any] = [
//            "id": "12345",
//            "name": "Frank",
//            "points": 5,
//            "isPremium": true
//        ]
        
//        let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: [])
        return jsonData
    }
}

struct CodeableBootcamp: View {
    
    @StateObject var vm = CodeableViewModel()
    
    var body: some View {
        
        VStack(spacing: 20) {
            if let customer = vm.customer {
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text(customer.isPremium.description)
            }
        }
    }
}

struct CodeableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CodeableBootcamp()
    }
}

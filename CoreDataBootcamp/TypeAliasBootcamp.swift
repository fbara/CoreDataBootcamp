//
//  TypeAliasBootcamp.swift
//  CoreDataBootcamp
//
//  Created by Frank Bara on 12/11/21.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct TypeAliasBootcamp: View {
    
//    @State var item: MovieModel = MovieModel(title: "Title", director: "Frank", count: 5)
    @State var item: TVModel = TVModel(title: "Title", director: "Frank", count: 10)
    
    var body: some View {
        
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

struct TypeAliasBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TypeAliasBootcamp()
    }
}

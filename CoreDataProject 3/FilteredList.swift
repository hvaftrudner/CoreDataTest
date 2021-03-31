//
//  FilteredList.swift
//  CoreDataProject 3
//
//  Created by Kristoffer Eriksson on 2021-03-29.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    
    var fetchRequest: FetchRequest<T>
    var singer: FetchedResults<T> {
        fetchRequest.wrappedValue
    }
    
    //challenge 1
    var descriptors: [NSSortDescriptor]?
    
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self){ singer in
            self.content(singer)
        }
    }
    
    init(filter: FilterType, filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content){
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: descriptors ?? [], predicate: NSPredicate(format: "%K \(filter.rawValue) %@", filterKey, filterValue))
        
        self.content = content
    }
}

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList()
//    }
//}

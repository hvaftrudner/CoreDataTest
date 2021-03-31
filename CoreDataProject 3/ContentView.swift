//
//  ContentView.swift
//  CoreDataProject 3
//
//  Created by Kristoffer Eriksson on 2021-03-29.
//

import SwiftUI

enum FilterType: String, CaseIterable {
    case beginsWith = "BEGINSWITH"
    case beginsWithCaseInsensitive = "BEGINSWITH[c]"
    case contains = "CONTAINS"
    case containsWithCaseInsensitive = "CONTAINS[c]"
    case endsWith = "ENDSWITH"
    case endsWithCaseInsensitive = "ENDSWITH[c]"
}

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @State var lastNameFilter = ""
    
    //challenge 2
    @State private var filter: FilterType = .beginsWith
    
    //extra challenge
    @State private var toggleName = false
    
    var body: some View {
        VStack{
            //list sorted singers
            FilteredList(filter: filter, filterKey: toggleName ? "firstName": "lastName" , filterValue: lastNameFilter){ (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add examples"){
                
                let singer1 = Singer(context: self.moc)
                singer1.firstName = "Taylor"
                singer1.lastName = "Swift"
                
                let singer2 = Singer(context: self.moc)
                singer2.firstName = "Ed"
                singer2.lastName = "Sherekan"
                
                let singer3 = Singer(context: self.moc)
                singer3.firstName = "Abelle"
                singer3.lastName = "Ajihoosson"
                
                let singer4 = Singer(context: self.moc)
                singer4.firstName = "Krille"
                singer4.lastName = "Hvaftrudner"
                
                try? self.moc.save()
            }
            
            Button(toggleName ? "use firstName" : "use LastName"){
                self.toggleName.toggle()
            }
            
            TextField("enter sorting letter: ", text: $lastNameFilter)
                .frame(height: 20)
                .border(Color.black)
            
            Picker("What to sort by:", selection: $filter){
                ForEach(FilterType.allCases, id: \.self){ filter in
                    Text("\(filter.rawValue)")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
//            Button("Show A"){
//                self.lastNameFilter = "A"
//            }
//            Button("Show S"){
//                self.lastNameFilter = "S"
//            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

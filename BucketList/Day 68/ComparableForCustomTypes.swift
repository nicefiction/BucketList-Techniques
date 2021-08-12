// ComparableForCustomTypes.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/adding-conformance-to-comparable-for-custom-types

// MARK: - LIBRARIES -

import SwiftUI



struct User: Identifiable,
             Comparable {
   
   // MARK: - PROPERTIES
   
   let firstName: String
   let lastName: String
   let id: UUID = UUID()
   
   
   
   // MARK: - METHODS
   
   static func <(lhs: User,
                 rhs: User)
   -> Bool {
      
      return lhs.lastName < rhs.lastName
   }
}





struct ComparableForCustomTypes: View {
   
   // MARK: - PROPERTIES
   
   let values: Array<Int> = [
      9, 4, 6, 1 , 2 , 3 , 8 , 5
   ]
   
   let users: Array<User> = [
      User(firstName: "Dorothy", lastName: "Gale"),
      User(firstName: "Ozma", lastName: "of Oz"),
      User(firstName: "Emily", lastName: "Brontë")
   ].sorted { (user1: User, user2: User) in
      user1.firstName > user2.firstName
   }
   /// That absolutely works ,
   /// but it’s not an ideal solution for two reasons .
   /// First , this is model data ,
   /// by which I mean that it’s affecting the way we work with the User struct .
   /// That struct and its properties are our data model ,
   /// and in a well-developed application
   /// we don’t really want to tell the model
   /// how it should behave inside our SwiftUI code.
   /// SwiftUI represents our view , i.e. our layout ,
   /// and if we put model code in there then things get confused .
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      VStack {
         List {
            ForEach(values.sorted(), id: \.self) { (value: Int) in
               Text("\(value)")
                  .font(.title)
            }
         }
         List {
            ForEach(users.sorted()) { (user: User) in
               Text("\(user.firstName) \(user.lastName)")
            }
         }
      }
   }
}





// MARK: - PREVIEWS -

struct ComparableForCustomTypes_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ComparableForCustomTypes()
   }
}

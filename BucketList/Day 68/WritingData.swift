// WritingData.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/writing-data-to-the-documents-directory

// MARK: - LIBRARIES -

import SwiftUI



struct WritingData: View {
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      Text("Hello, World!")
         .onTapGesture {
            let stringMessage = "Test Message"
            let url = self.getDocumentsDirectory().appendingPathComponent("message.txt")
            
            do {
               try stringMessage.write(to: url,
                                       atomically: true,
                                       encoding: .utf8)
               let input = try String(contentsOf: url)
               print(input)
            } catch let error {
               print(error.localizedDescription)
            }
         }
   }
   
   
   
   // MARK: - METHODS
   
   func getDocumentsDirectory()
   -> URL {
      
       /// Find all possible documents directories for this user :
       let paths = FileManager.default.urls(for: .documentDirectory,
                                            in: .userDomainMask)

       /// Just send back the first one ,
       /// which ought to be the only one :
       return paths[0]
   }
   /// Now that we have a directory to work with ,
   /// we can read and write files there freely .
}





// MARK: - PREVIEWS -

struct WritingData_Previews: PreviewProvider {
   
   static var previews: some View {
      
      WritingData()
   }
}

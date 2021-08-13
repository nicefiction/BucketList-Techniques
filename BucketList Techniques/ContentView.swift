// ContentView.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/using-touch-id-and-face-id-with-swiftui

// MARK: - LIBRARIES -

import SwiftUI
import LocalAuthentication



struct ContentView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var isUnlocked: Bool = false
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
//      MapView()
//         .edgesIgnoringSafeArea(.all)
      VStack {
         // Text("\(self.isUnlocked ? "Unlocked" : "Locked")")
         if self.isUnlocked {
            Text("Unlocked")
         } else {
            Text("Locked")
         }
      }
      .onAppear(perform: authenticate)
   }
   
   
   
   // MARK: - METHODS
   
   func authenticate() {
      
      let context = LAContext()
      var error: NSError?
      
      // check whether biometric authentication is possible
      if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   error: &error) {
         
         // it's possible, so go ahead and use it
         let reason = "We need to unlock your data."
         
         context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                localizedReason: reason) { success, authenticationError in
            
            // authentication has now completed
            DispatchQueue.main.async {
               if success {
                  // authenticated successfully
                  self.isUnlocked = true
               } else {
                  // there was a problem
               }
            }
         }
      } else {
         // no biometrics
      }
   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContentView()
   }
}

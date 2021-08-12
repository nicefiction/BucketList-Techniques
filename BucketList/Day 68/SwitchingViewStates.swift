// SwitchingViewStates.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/switching-view-states-with-enums

// MARK: - LIBRARIES -

import SwiftUI


struct LoadingView: View {
   
   var body: some View {
      
      Text("Loading...")
         .font(.title)
   }
}





struct SuccessView: View {
   
   var body: some View {
      
      Text("Success!")
         .font(.title)
   }
}





struct FailureView: View {
   
   var body: some View {
      
      Text("Failure.")
         .font(.title)
   }
}





struct SwitchingViewStates: View {
   
   // MARK: - NESTED TYPES
   
   enum LoadingState {
      
      case loading, success, failure
   }
   
   
   
   // MARK: - PROPERTIES
   
   var loadingState: SwitchingViewStates.LoadingState = SwitchingViewStates.LoadingState.loading
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      VStack {
         Group {
            if Bool.random() {
               Circle()
            } else {
               Rectangle()
            }
         }
         Group {
            switch loadingState {
            case SwitchingViewStates.LoadingState.loading: LoadingView()
            case SwitchingViewStates.LoadingState.success: SuccessView()
            case SwitchingViewStates.LoadingState.failure: FailureView()
            }
         }
      }
   }
}





// MARK: - PREVIEWS -

struct SwitchingViewStates_Previews: PreviewProvider {
   
   static var previews: some View {
      
      SwitchingViewStates()
   }
}


import SwiftUI

@main
struct ContactListApp : App {
    
    var body: some Scene {
        
        WindowGroup {
            
            ContentView( viewModel : ContactsListViewModel() )
            
        }
    }
}

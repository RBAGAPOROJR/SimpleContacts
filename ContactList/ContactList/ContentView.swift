
import SwiftUI

struct ContentView : View {
    
    @State var viewModel : ContactsListViewModel
    
    var body : some View {
        
        NavigationStack {
            
            List {
                
                ForEach( viewModel.listData ) {
                    
                    contact in ContactRow( contact: contact )
                    
                }
                .onDelete( perform: deleteContacts )
                .onMove( perform: moveContacts )
                
                // Displaying contact count.
                HStack {
                    
                    Spacer()
                    Text( viewModel.displatCount )
                        .foregroundStyle( .secondary )
                    Spacer()
                    
                }
            }
            .navigationTitle( viewModel.navTitle )
            .searchable( text: $viewModel.searchBox, placement: .navigationBarDrawer( displayMode: .always ), prompt: "Search for Contact" )
            .onChange( of: viewModel.searchBox ) {
                
                viewModel.filterSearch()
                
            }
            .animation( .easeInOut, value: viewModel.searchBox )
            
            // Toolbar buttons.
            .toolbar{
                
                HStack {
                    
                    Button( "Add" ){
                        
                        // addContacts()
                        viewModel.addRandomContact()
                        
                    }
                    Spacer()
                    EditButton()
                    Spacer()
                    Button( "Reset" ){
                        
                        viewModel.resetContactList()
                        
                    }
                }
                .padding()
            }
        } /// END OF NAVIGATION STACK
        
    } /// END OF BODY

    
    // Function to delete contacts.
    func deleteContacts( offSet : IndexSet ){
        
        withAnimation{
            
            viewModel.deleteContacts( offSet: offSet )
            
        }
    }
    
    // Function to move contacts.
    func moveContacts( from : IndexSet, to : Int ){
        
        withAnimation{
            
            viewModel.moveContacts( from: from, to: to )
            
        }
    }
}


#Preview {
    
    ContentView( viewModel : ContactsListViewModel() )
    
}



import SwiftUI

/// Contact list view
struct ContactsListView : View {
    
    @State var viewModel : ContactsListViewModel
    
    var body : some View {
        
        //TODO: Replace below with list
        //TODO: to delete
        Text( "INFO6131 : Midterm" )
            .font( .largeTitle )
        Spacer()
            Text( "Ronald Bagaporo Jr. | 1132935" )
            .foregroundColor( .secondary )
        Spacer()
        
        NavigationStack {
            
            // List of contacts.
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
        }
    } // end of body
    
//    func addContacts(){
//        withAnimation{
//            guard let randomContacts = viewModel.contacts.contacts.randomElement() else {
//                return
//            }
//            viewModel.addContacts( contact : randomContacts )
//        }
//    }
    
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
    
    ContactsListView( viewModel : ContactsListViewModel() )
    
}


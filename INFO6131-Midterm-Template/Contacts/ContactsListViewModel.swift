
import SwiftUI
import Observation

@Observable
final class ContactsListViewModel {
    
    //TODO: Add properties and methods below to complete ViewModel
    
    // Properties
    var contacts        : ContactStore // store
    var navTitle        : String = ""
    var searchBox       : String = ""
    var searchResults   : [ Contact ] = []
    
    private var contactStore = ContactStore.testStore

    // Computed property for the list data.
    var listData : [ Contact ] {
        
        return searchBox.isEmpty ? contacts.contacts : searchResults
        
    }
    
    // Computed property for displaying contact count.
    var  displatCount : String {
        
        "\( listData.count ) contacts"
        
    }
    
    // Initializer
    init( contacts : ContactStore = ContactStore.testStore, navTitle: String = "Contacts" ) {
        
        self.contacts   =   contacts
        self.navTitle   =   navTitle
        
    }
    
//    func filterSearch() {
//        
//        searchResults = contacts.contacts.filter( {
//            
//            $0.firstName.localizedCaseInsensitiveContains( searchBox )
//            
//        } )
//    }
    
    // Filter contacts based on search box text.
    func filterSearch() {
        
        searchResults = contacts.contacts.filter { contact in
            let fullName = "\( contact.firstName ) \( contact.lastName )"
            return fullName.localizedCaseInsensitiveContains( searchBox )
            
        }
    }

    
//    func addContacts( contact : Contact ) {
//        contacts.contacts.append( contact )
//    }
    
    // Add a random contact.
    func addRandomContact() {
        
        let randomContact = Contact(
            firstName   :   "Random",
            lastName    :   "Contact",
            phone       :   "123-456-7890",
            email       :   "random.contact@example.com",
            gender      :   "Unknown",
            address     :   "123 Random Street",
            city        :   "Random City",
            country     :   "Random Country",
            isFavorite  :   false
            
        )

        contactStore.contacts.append( randomContact )

    }
    
    // Delete contacts at specified offsets.
    func deleteContacts( offSet : IndexSet ){
        
        contacts.contacts.remove( atOffsets: offSet )
        
    }
    
    // Move contacts from one position to another.
    func moveContacts( from : IndexSet, to : Int ){
        
        contacts.contacts.move( fromOffsets: from , toOffset: to )
        
    }
    
    // Reset the contact list to the original data.
    func resetContactList() {
        
        contactStore.contacts = ContactStore.mockData

    }

}

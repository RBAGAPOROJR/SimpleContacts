
import SwiftUI
import Observation
import Foundation

@Observable
final class ContactsListViewModel {
    
    /// Properties
    var contacts        : ContactStore
    var navTitle        : String = ""
    var searchBox       : String = ""
    var searchResults   : [ Contact ] = []
    
    
    private var contactStore = ContactStore.testStore

    /// Computed property for the list data.
    var listData : [ Contact ] {
        
        return searchBox.isEmpty ? contacts.contacts : searchResults
        
    }
    
    /// Computed property for displaying contact count.
    var  displatCount : String {
        
        "\( listData.count ) contacts"
        
    }
    
    /// Initializer
    init( contacts : ContactStore = ContactStore.testStore, navTitle: String = "Contacts" ) {
        
        self.contacts   =   contacts
        self.navTitle   =   navTitle
        
    }
    
    
    /// Filter contacts based on search box text.
    func filterSearch() {
        
        searchResults = contacts.contacts.filter { contact in
            let fullName = "\( contact.firstName ) \( contact.lastName )"
            return fullName.localizedCaseInsensitiveContains( searchBox )
            
        }
    }
    
    func generateRandomName(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyz"
        var name = String((0..<length).map { _ in letters.randomElement()! })
        name = name.prefix(1).capitalized + name.dropFirst()
        return name
    }
    
    func generateRandomGender() -> String {
        let genders = [ "Man", "Female" ]
        return genders.randomElement()!
    }
    
    func generateRandomFavorite() -> Bool {
        return Bool.random()
    }

    /// Add a random contact.
    func addRandomContact() {
        let randomName      = generateRandomName(length: 5)
        let randomLName     = generateRandomName(length: 12)
        let randomGender    = generateRandomGender()
        let randomFavorite  = generateRandomFavorite()

        let randomContact = Contact(
            firstName   :   randomName,
            lastName    :   randomLName,
            phone       :   "123-456-7890",
            email       :    randomName.lowercased() + "@example.com",
            gender      :   randomGender,
            address     :   "123 Random Street",
            city        :   "Random City",
            country     :   "Random Country",
            isFavorite  :   randomFavorite
        )
        print( randomFavorite )
        contactStore.contacts.append(randomContact)
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

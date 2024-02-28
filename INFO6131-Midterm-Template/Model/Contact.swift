
import Foundation

struct Contact : Identifiable {
    
    // Properties
    let id          = UUID()
    let firstName   : String
    let lastName    : String
    let phone       : String
    let email       : String
    let gender      : String
    let address     : String
    let city        : String
    let country     : String
    var isFavorite  : Bool  // Changed from "let" to "var" to allow modification.
    
    //TODO: Add computed property for full name
    // Full name of the contact.
    var fullName : String {
        
        "\( firstName) \( lastName )"
        
    }

    //TODO: Add computed property for full address
    // Full address of the contact.
    var fullAddress : String {
        
        "\( address ), \( city ), \( country )"
        
    }
    
    // Initializer
        
    // Initializes a contact with the given parameters.
    // - Parameters:
    //   - id: The unique identifier of the contact.
    //   - firstName: The first name of the contact.
    //   - lastName: The last name of the contact.
    //   - phone: The phone number of the contact.
    //   - email: The email address of the contact.
    //   - gender: The gender of the contact.
    //   - address: The address of the contact.
    //   - city: The city of the contact.
    //   - country: The country of the contact.
    //   - isFavorite: Indicates whether the contact is marked as favorite. Default is `false`.
    internal init( id : UUID = UUID(),
                   firstName : String, lastName : String,
                   phone : String, email : String, gender : String,
                   address : String, city : String, country : String,
                   isFavorite : Bool = false ) {
        
        self.firstName  =   firstName
        self.lastName   =   lastName
        self.phone      =   phone
        self.email      =   email
        self.gender     =   gender
        self.address    =   address
        self.city       =   city
        self.country    =   country
        self.isFavorite =   isFavorite
        
    }
}

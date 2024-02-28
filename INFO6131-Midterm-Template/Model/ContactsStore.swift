
import Foundation
import Observation

@Observable
final class ContactStore {
    
    // Array to hold contacts
    var contacts : [ Contact ]
    
    // Initializer to initialize the contact store with provided contacts or mock data.
    init( contacts : [ Contact ] = mockData  ) {
        
        self.contacts = contacts
        
    }
}

extension ContactStore {
    
    static var mockData = [
        
        // Mock data for testing purposes.
        Contact( firstName  : "Ronald",
                lastName    : "Bagaporo Jr.",
                phone       : "+1 ( 519 ) 697 - 6380",
                email       : "r_bagaporo@fanshaweonline.ca",
                gender      : "Male",
                address     : "Fairview Avenue",
                city        : "London, ON",
                country     : "Canada",
                isFavorite  : true ),
        
        Contact( firstName  : "Geselle",
                lastName    : "Andal",
                phone       : "( 416 )123-4567",
                email       : "g_andal@gmail.com",
                gender      : "Female",
                address     : "69 Wellington St. West",
                city        : "Toronto",
                country     : "Canada",
                isFavorite  : true ),
        
        Contact( firstName  : "Ronald",
                lastName    : "Bagaporo III",
                phone       : "( 416 )123-4567",
                email       : "r_bagaporoIII@gmail.com",
                gender      : "Male",
                address     : "69 Wellington St. West",
                city        : "Toronto",
                country     : "Canada",
                isFavorite  : true ),
        
        Contact( firstName  : "Deitry",
                lastName    : "Bagaporo",
                phone       : "( 416 )123-4567",
                email       : "d_bagaporo@gmail.com",
                gender      : "Female",
                address     : "69 Wellington St. West",
                city        : "Toronto",
                country     : "Canada",
                isFavorite  : true ),
        
        Contact( firstName  : "Tom",
                lastName    : "Brady",
                phone       : "( 416 )123-4567",
                email       : "tom.brady@gmail.com",
                gender      : "Male",
                address     : "588 Riviera Drive",
                city        : "Tampa Bay",
                country     : "US",
                isFavorite  : true ),
        
        Contact( firstName  : "Payton",
                lastName    : "Manning",
                phone       : "( 647 )123-4567",
                email       : "manning@gmail.com",
                gender      : "Male",
                address     : "55 Haverstock Cr.",
                city        : "Georgetown",
                country     : "Canada",
                isFavorite  : false ),
        
        Contact( firstName  : "John-Christopher",
                lastName    : "Balnig",
                phone       : "( 905 )123-4567",
                email       : "john@gmail.com",
                gender      : "Male",
                address     : "55 Bristol Dr.",
                city        : "Caledon",
                country     : "Canada",
                isFavorite  : false ),
        
        Contact( firstName  : "Brett",
                lastName    : "Let",
                phone       : "( 416 )123-4567",
                email       : "dv@gmail.com",
                gender      : "Female",
                address     : "69 Wellington St. West",
                city        : "Toronto",
                country     : "Canada",
                isFavorite  : true ),
        
        Contact( firstName  : "Virat",
                lastName    : "Kohli",
                phone       : "( 647 )123-4567",
                email       : "manning@gmail.com",
                gender      : "Male",
                address     : "20 Fishing Cr.",
                city        : "Brampton",
                country     : "Canada",
                isFavorite  : true ),
        
        Contact( firstName  : "Rohit",
                lastName    : "Sharma",
                phone       : "( 647 )123-4567",
                email       : "sharma@gmail.com",
                gender      : "Female",
                address     : "22 Fishing Cr.",
                city        : "Brampton",
                country     : "Canada",
                isFavorite  : false ),
        
    ]

    // Singleton instance of ContactStore for easy access.
    static var testStore : ContactStore = ContactStore(  contacts : mockData  )
}


import SwiftUI

struct ContactRow : View {
    
    let contact : Contact
    var body : some View {
        
        //TODO: replace below with contact row
//        Text("Replace this with contact row")
        
        NavigationLink( destination: ContactDetail ( contact : contact ) ) {
            
            HStack {
                
                // Displaying gender-specific image.
                if contact.gender == "Female" {
                    
                    Image( "women" )
                        .resizable()
                        .aspectRatio( contentMode: .fit )
                        .frame( width: 25, height: 25 )
                                    
                } else {
                                
                    Image( "man" )
                        .resizable()
                        .aspectRatio( contentMode: .fit )
                        .frame( width: 25, height: 25 )
                    
                }
            
                // Displaying contact name.
                Text( contact.fullName )
                    .font( .headline )
                
                Spacer()
                
                // Displaying favorite status
                if contact.isFavorite {
                    
                    Image( systemName: "star.fill" )
                        .font( .headline )
                        .foregroundColor( .yellow )
                    
                }
            }
        }
    }
}


#Preview {
    
    ContactRow( contact : ContactStore.testStore.contacts[ 0 ] )
    
}

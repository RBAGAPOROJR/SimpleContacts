
import SwiftUI

struct ContactDetail : View {
    
    let contact : Contact
    
    var body : some View {
        
        //TODO: Complete detail view
//        Text("Contact detail view")
        
        NavigationLink( destination : ContactDetail( contact : contact ) ){
            VStack {
                
                // Displaying gender-specific image.
                if contact.gender == "Female" {
                    
                    Image( "women" )
                        .resizable()
                        .aspectRatio( contentMode: .fit )
                        .frame( width: 70, height: 70 )
                    
                } else {
                    
                    Image( "man" )
                        .resizable()
                        .aspectRatio( contentMode: .fit )
                        .frame( width: 70, height: 70 )
                    
                }
                
                // Displaying contact name and favorite status.
                HStack {
                    
                    Text( contact.fullName )
                        .font( .largeTitle )
                        .foregroundStyle( .black )
                    
                    if contact.isFavorite {
                        
                        Image( systemName: "star.fill" )
                            .font( .largeTitle )
                            .foregroundColor( .yellow )
                        
                    } else {
                        
                        Image( systemName: "star" )
                            .font( .headline )
                            .foregroundColor( .gray )
                        
                    }
                    
                }
                
                // Displaying contact details.
                ContactRowView( imageName : "phone.fill", value : contact.phone, label : "Phone" )
                ContactRowView( imageName : "envelope.fill", value : contact.email, label : "Email" )
                ContactRowView( imageName : "map.fill", value : contact.fullAddress, label : "Address" )

                Spacer()
                
            }
    
            .padding()
            
        }
    }
}


#Preview {
    
    ContactDetail( contact : ContactStore.testStore.contacts[ 0 ] )
    
}

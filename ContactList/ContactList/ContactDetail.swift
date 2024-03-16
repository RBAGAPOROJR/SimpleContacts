
import SwiftUI

struct ContactDetail : View {
    
    let contact : Contact
    
    var body : some View {
        
//        NavigationLink( destination : ContactDetail( contact : contact ) ){
        NavigationView {
            
            Form {
                
                /// Displaying gender-specific image.
                if contact.gender == "Female" {
                    
                    Image( "women" )
                        .resizable()
                        .aspectRatio( contentMode: .fit )
                        .frame( width: 70, height: 70 )
                        .frame( maxWidth: .infinity )
                    
                } else {
                    
                    Image( "man" )
                        .resizable()
                        .aspectRatio( contentMode: .fit )
                        .frame( width: 70, height: 70 )
                        .frame( maxWidth: .infinity )
                    
                }
                VStack{
                    
                    /// Displaying contact name and favorite status.
                    HStack{
                        
                        Text( contact.fullName )
                            .font( .largeTitle )
                            .padding( .bottom )
                        
                        if contact.isFavorite {
                            
                            Image( systemName: "star.fill" )
                                .font( .title )
                                .foregroundColor( .yellow )
                            
                        } else {
                            
                            Image( systemName: "star" )
                                .font( .headline )
                                .foregroundColor( .gray )
                            
                        }
   
                    }
                    
                    
                    /// Displaying contact details.
                    ContactRowView( imageName : "phone.fill", value : contact.phone, label : "Phone" ).padding( .bottom )
                    ContactRowView( imageName : "envelope.fill", value : contact.email, label : "Email" ).padding( .bottom )
                    ContactRowView( imageName : "map.fill", value : contact.fullAddress, label : "Address" ).padding( .bottom )
                    
                }
            }
            
        }
    }
}


#Preview {
    
    ContactDetail( contact : ContactStore.testStore.contacts[ 0 ] )
    
}

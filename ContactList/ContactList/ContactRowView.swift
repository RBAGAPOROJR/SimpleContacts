
import SwiftUI

/// View for displaying a single contact row.
struct ContactRowView: View {
    
    let imageName   : String
    let value       : String
    let label       : String
    
    var body: some View {
        
        HStack {
            
            /// Contact icon
            Image( systemName: imageName )
                .foregroundColor( .blue )
            
            /// Contact information
            Text( "\( label ) : \( value )" )
                .font( .subheadline )
            Spacer()
        }
        
        
    }
}


struct ContactRowView_Previews : PreviewProvider {
    
    static var previews : some View {
        
        ContactRowView( imageName: "person.fill", value: "John Doe", label: "Name" )
        
    }
}



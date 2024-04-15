//
//  EmployeeRowView.swift
//  AssignmentTwo
//
//  Created by RNLD on 2024-04-11.
//

import SwiftUI

struct EmployeeRowView : View {
    
    let imageName   : String
    let value       : String
    
    var body: some View {
        
        HStack {
            
            Image( systemName: imageName )
                .foregroundColor( .blue )
                .font( .system( size: 30 ) )
                .frame( width: 40 )
            
            Text( "\( value )" )
                .font( .headline )
            Spacer()
        }
    }
    
    /// FORMAT TO USE :
    /// EmployeeRowView( imageName: "person.and.background.striped.horizontal", value: "Contructor" )

}



struct EmployeeRowView_Previews : PreviewProvider {
    
    static var previews : some View {
        
        EmployeeRowView( imageName: "person.fill", value: "John Doe")
        
    }
}



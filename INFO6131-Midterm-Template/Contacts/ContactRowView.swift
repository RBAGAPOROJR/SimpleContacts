//
//  ContactRowView.swift
//  INFO6131-Midterm-Template
//
//  Created by RNLD on 2024-02-28.
//

import SwiftUI

// View for displaying a single contact row.
struct ContactRowView: View {
    
    let imageName   : String
    let value       : String
    let label       : String

    var body: some View {
    
        HStack {
            
            // Contact icon
            Image( systemName: imageName )
                .foregroundColor( .blue )
                .padding( .trailing, 8 )
        
            // Contact information
            Text( "\( label ) : \( value )" )
                .font( .subheadline )
            Spacer()
            
        }
        .padding()
    }
}

//
//  SettingsView.swift
//  AssignmentTwo
//
//  Created by RNLD on 2024-04-10.
//

import SwiftUI

struct SettingsView : View {
    
    var body : some View {
        
        VStack {
            
            Text( "Employees App" )
                .font( .title )
                .padding( .top, 100 )
                
            Text( "Version: 1.0" )
                .padding( .bottom, -0 )
            Text( "Assignment 2" )
            
            Spacer()
            
            Text( "Developed by : Ronald Bagaporo Jr." )
                .padding( .bottom, -20 )
            Text( "Student No. : 1132935" )
                .padding()
            
            Spacer()
            
            Text( "INFO - 6131 - 01" )
                .padding( .bottom, -20 )
            Text( "iOS App Development 2" )
                .padding()
            
            Spacer()
            
            
            Text( "Thank you so much Sir Dylan!" )
                .font( Font.custom( "Zapfino", size: 18 ) )
            
            Spacer()
        }
        .navigationTitle( "Settings" )
    }
}



struct SettingsView_Preview : PreviewProvider {
    
    static var previews: some View {
        
        SettingsView()
        
    }
}

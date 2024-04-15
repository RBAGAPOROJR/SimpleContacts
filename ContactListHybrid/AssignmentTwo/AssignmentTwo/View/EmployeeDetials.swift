//
//  EmployeeDetials.swift
//  AssignmentTwo
//
//  Created by RNLD on 2024-04-11.
//

import SwiftUI

struct EmployeeDetails : View {
    
    let employee: Employee
    
    var body: some View {
        
        NavigationView {
            HStack {
                
                if let url = URL( string : employee.photoURLLarge ) {
                    AsyncImage( url: url ) { image in
                        image
                            .resizable()
                            .edgesIgnoringSafeArea( .all )
                            .frame( width: 550, height: 450 )
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
        }


        Form {
            Section( employee.fullName ){}.font( .largeTitle ).padding( .bottom,-60 )
            Section( header: CustomHeader( imageName: "person.text.rectangle.fill", text: employee.biography ) ){}.padding( .bottom,-60 )
            Section( header: CustomHeader( imageName: "phone.circle.fill", text: employee.phoneNumber ) ){}.padding( .bottom,-60 )
            Section( header: CustomHeader( imageName: "envelope.circle.fill", text: employee.emailAddress ) ){}.padding( .bottom,-60 )

            if ( employee.employeeType.rawValue == "CONTRACTOR" ) {

                Section( header: CustomHeader( imageName: "person.and.background.striped.horizontal", text: "Contructor" ) ){}
                
            } else if ( employee.employeeType.rawValue == "FULL_TIME" ) {
                
                Section( header: CustomHeader( imageName: "person.and.background.striped.horizontal", text: "Full-time" ) ){}
                
            } else {
                
                Section( header: CustomHeader( imageName: "person.and.background.striped.horizontal", text: "Part-time" ) ){}
                
            }
        }
    }
}

struct CustomHeader : View {
    
    let imageName : String
    let text : String
    
    var body : some View {
        
        HStack {
            
            Image( systemName: imageName )
                .foregroundColor( .blue ) //// Customize the color of the image
                .font( .system( size: 30 ) )
            
            Text( text )
                .font( .subheadline )
                .foregroundColor( .black ) //// Customize the color of the text
        }
    }
}

struct EmployeeDetails_Previews : PreviewProvider {
    
    static var previews : some View {
        
        let sampleEmployee = Employee( uuid: "1", fullName: "John Doe", phoneNumber: "123-456-7890", emailAddress: "john@example.com", biography: "Lorem ipsum dolor sit amet.", photoURLSmall: "https://example.com/small.jpg", photoURLLarge: "https://example.com/large.jpg", team: "Engineering", employeeType: .fullTime )
        
        EmployeeDetails( employee: sampleEmployee )
        
    }
}

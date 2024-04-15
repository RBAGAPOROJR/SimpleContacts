//
//  EmployeesListView.swift
//  AssignmentTwo
//
//  Created by RNLD on 2024-04-10.
//


import SwiftUI

struct EmployeesListView : View {
    
    @ObservedObject var viewModel   : EmployeeViewModel

    var body: some View {
        
        NavigationView {
            
            List( viewModel.searchResults.isEmpty ? viewModel.employees : viewModel.searchResults ) { employee in
                NavigationLink( destination: EmployeeDetails( employee: employee ) ) {
                    
                    VStack {
                        
                        HStack{
                            
                            if let url = URL( string: employee.photoURLSmall ) {
                                
                                AsyncImage( url: url ) { image in
                                    image
                                        .resizable()
                                        .aspectRatio( contentMode: .fit )
                                } placeholder: {
                                    
                                    ProgressView()
                                    
                                }
                                .frame( width: 100, height: 100 )
                                .clipShape( RoundedRectangle( cornerRadius: 8 ) )
                                .shadow( color: Color.black.opacity( 0.3 ), radius: 5, x: 2, y: 2 )
                            }
                            VStack ( alignment : .leading ){
                                
                                Text( employee.fullName )
                                    .font( .headline )
                                
                                Text( employee.team )
                                    .foregroundColor( .gray )
                                    .font( .footnote )
                                
                            }
                        }
                    }
                }
            }
            .navigationTitle( "Employees" )
            .searchable( text: $viewModel.searchBox, placement: .navigationBarDrawer( displayMode: .always ),
                         prompt: "Search for Employee" )
            .onAppear { viewModel.fetchEmployees() }
            .onChange ( of: viewModel.searchBox ) { viewModel.filterSearch() }
        }
    }
}



struct EmployeesListView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        EmployeesListView( viewModel : EmployeeViewModel() )
        
    }
}

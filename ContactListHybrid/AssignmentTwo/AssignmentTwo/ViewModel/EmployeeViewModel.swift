//
//  EmployeeViewModel.swift
//  AssignmentTwo
//
//  Created by RNLD on 2024-04-10.
//


import SwiftUI

class EmployeeViewModel: ObservableObject {
    
    @Published var employees = [ Employee ]()
    @Published var searchBox = ""
    @Published var searchResults = [ Employee ]()

    
    func fetchEmployees() {
        
        guard let url = URL( string: "https://s3.amazonaws.com/sq-mobile-interview/employees.json" ) else {
            
            return
            
        }

        URLSession.shared.dataTask( with: url ) { data, response, error in
            
            guard let data = data else {
                
                return
                
            }

            do {

                let decodedData = try JSONDecoder().decode( EmployeeResponse.self, from: data )
                DispatchQueue.main.async {
                    
                    self.employees = decodedData.employees
                    
                }
            } catch {
                
                print( "Error decoding JSON: \( error )" )
                
            }
            
        }.resume()

    }
    
    
    func filterSearch() {
        
        searchResults = employees.filter { employee in
            
            let fullName = employee.fullName
            return fullName.localizedCaseInsensitiveContains( searchBox )
            
        }
    }
}

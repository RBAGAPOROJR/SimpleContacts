//
//  ContentView.swift
//  AssignmentTwo
//
//  Created by RNLD on 2024-04-04.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage( "onboardingRequired3" ) var onboardingRequired : Bool = true
    @StateObject var viewModel = EmployeeViewModel()
    @State private var defTab = 1

    var body: some View { /// selectedTab state variable for selection
        
        TabView( selection : $defTab ) {
            
            /// Employees tab
            EmployeesListView( viewModel: viewModel )
                .tabItem {
                    
                    Image( systemName: "person.3" )
                    Text( "Employees" )
                    
                }.tag( 1 )

            /// Settings tab
            SettingsView()
                .tabItem {
                    
                    Image( systemName: "gear" )
                    Text( "Settings" )
                    
                }.tag( 2 )
        }
        .fullScreenCover( isPresented: $onboardingRequired ) {
            
            onboardingRequired = false
            
        } content: {
            
            OnboardingView(onboardingRequired: $onboardingRequired)
            // OnboardingView2( onboardingRequired: $onboardingRequired )
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
        
    }
}
